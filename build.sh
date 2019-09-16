#!/bin/bash

echo "
  -----------------------------------------------------------------
       __   __  _______  ______   _______  _______  _______       
      |  | |  ||   _   ||      | |       ||       ||       |      
      |  |_|  ||  |_|  ||  _    ||   _   ||   _   ||    _  |      
      |       ||       || | |   ||  | |  ||  | |  ||   |_| |      
      |       ||       || |_|   ||  |_|  ||  |_|  ||    ___|      
      |   _   ||   _   ||       ||       ||       ||   |          
      |__| |__||__| |__||______| |_______||_______||___|          
     ___   __    _  _______  _______  _______  ___      ___     
    |   | |  |  | ||       ||       ||   _   ||   |    |   |    
    |   | |   |_| ||  _____||_     _||  |_|  ||   |    |   |    
    |   | |       || |_____   |   |  |       ||   |    |   |    
    |   | |  _    ||_____  |  |   |  |       ||   |___ |   |___ 
    |   | | | |   | _____| |  |   |  |   _   ||       ||       |
    |___| |_|  |__||_______|  |___|  |__| |__||_______||_______|
    
         © 2019 João Batista - All Rights Reserved

  -----------------------------------------------------------------

"
# CREATE CONSTANTS

BASE_DIR=$(dirname "$0")
NAMENODE=$(cat $BASE_DIR/namenode)
TEMPLATE_NAMENODE=$NAMENODE
TEMPLATE_DATANODES=$(sed -e :a -e "N;s/\n/,/;ba" $BASE_DIR/datanode)
ACTION=$1

# HELP

echo "Execute \"./build.sh help\" to show options\n"

if [ -z "$ACTION" ]; then

	exit;

fi

if [[ $ACTION == *"help"* ]]; then

	echo "

------------ HELP ------------

Options:

- help : Show help infos
- ssh : generate ssh-keygen and copy ssh-keys to all hosts
- copy : copy all files in path \"/services/\" to all datanodes
- config : copy all config files to all datanodes
- clear : remove all files in hdfs path
- dfs : create all paths in hdfs

"
	exit

fi

# CHECK IF NAMENODE IS CURRENT HOST
LOCAL_IP=$(ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p')
NAMENODE_IP=$(ping -c 1  hadoopmaster | head -1 | grep -oE ' \(([0-9\.]+)\)' | sed  -e 's/(//;s/)//;s/^[[:space:]]*//')
echo "
Namenode IP: $NAMENODE_IP
Machine IP: $LOCAL_IP"
if [ "$LOCAL_IP" != "$NAMENODE_IP" ]; then

	echo "You should run this script in host \"$TEMPLATE_NAMENODE\""
	exit 1

fi

# CREATE DATANODE FILE IN HADOOP/HBASE

cp $BASE_DIR/datanode $BASE_DIR/hadoop/etc/hadoop/
rm $BASE_DIR/hadoop/etc/hadoop/slaves
mv $BASE_DIR/hadoop/etc/hadoop/datanode $BASE_DIR/hadoop/etc/hadoop/slaves

cp $BASE_DIR/datanode $BASE_DIR/hbase/conf/
rm $BASE_DIR/hbase/conf/regionservers
mv $BASE_DIR/hbase/conf/datanode $BASE_DIR/hbase/conf/regionservers

cp $BASE_DIR/datanode $BASE_DIR/spark/conf/
rm $BASE_DIR/spark/conf/slaves
mv $BASE_DIR/spark/conf/datanode $BASE_DIR/spark/conf/slaves



# REPLACE VARIABLES FROM TEMPLATES

if [[ $ACTION == *"config"* ]]; then

	COUNT=$(cat $BASE_DIR/templates | wc -l)
	for ((index=1; $index<=$COUNT; index++)); do

		TEMPLATE=$(sed "${index}!d" $BASE_DIR/templates)
		TEMPLATE=$(echo $TEMPLATE | sed -e "s;\r;;g")
		FILE_DIR=$(dirname $TEMPLATE)
		FILE_NAME=$(echo $(basename $TEMPLATE) | sed -e "s;\.template;;g")
		FILE=$(echo $FILE_DIR/$FILE_NAME)
		rm $BASE_DIR/$FILE
		cp $BASE_DIR/$TEMPLATE $BASE_DIR/$FILE
		sed -i -e "s;%TEMPLATE_JAVA_HOME%;$JAVA_HOME;g" -e "s;%COUNT%;$COUNT;g" -e "s;%TEMPLATE_NAMENODE%;$TEMPLATE_NAMENODE;g" -e "s;%TEMPLATE_DATANODES%;$TEMPLATE_DATANODES;g" "$FILE"
		echo "File Created: $FILE"

	done

	sed -e "s;%TEMPLATE_JAVA_HOME%;$JAVA_HOME;g" /services/hadoop/etc/hadoop/hadoop-env.template.sh > /services/hadoop/etc/hadoop/hadoop-env.sh
	echo "File Created: hadoop/etc/hadoop/hadoop-env.sh"
	
	sed -e "s;%TEMPLATE_JAVA_HOME%;$JAVA_HOME;g" /services/hbase/conf/hbase-env.template.sh > /services/hbase/conf/hbase-env.sh
	echo "File Created: hbase/conf/hbase-env.sh"

	COUNT=$(cat $BASE_DIR/datanode | wc -l)
	sed -e "s;%COUNT%;$COUNT;g" /services/hadoop/etc/hadoop/hdfs-site.template.xml > /services/hadoop/etc/hadoop/hdfs-site.xml
	echo "File Created: hadoop/etc/hadoop/hdfs-site.xml"

	# To Spark
	cp /services/hadoop/etc/hadoop/core-site.xml /services/spark/conf/
	cp /services/hadoop/etc/hadoop/hdfs-site.xml /services/spark/conf/
	cp /services/hive/conf/hive-site.xml /services/spark/conf/
	cp /services/hbase/conf/hbase-site.xml /services/spark/conf/

	# To Hbase
	cp /services/hadoop/etc/hadoop/hdfs-site.xml /services/hbase/conf/

	rm -r /services/hadoop/logs/*
	rm -r /services/spark/logs/*
	rm -r /services/hive/logs/*
	rm -r /services/hbase/logs/*
	
fi

# CONFIGURE SSH KEYS

if [[ $ACTION == *"ssh"* ]]; then

	ssh-keygen
	ssh-copy-id -i $HOME/.ssh/id_rsa.pub hadoop@$TEMPLATE_NAMENODE

fi

# COPY CONFIG FILES

if [[ $ACTION == *"config"* ]]; then

	sed -i -e "s/source\ \/services\/\.bashrc//g" /home/hadoop/.bashrc
	sed -i "/^$/d" /home/hadoop/.bashrc
	echo "source /services/.bashrc" >> /home/hadoop/.bashrc
	sudo chmod 777 -R /services/hdfs
	
fi


# LOOP IN DATANODES
COUNT=$(cat $BASE_DIR/datanode | wc -l)
NUM_START=1

if [ ! -z "$2" ]; then

	INDEX_DATANODE=$(grep -n $2 datanode | head -n 1 | cut  -d: -f1)

	if [ ! -z "$INDEX_DATANODE" ]; then

		NUM_START=$INDEX_DATANODE
		COUNT=$INDEX_DATANODE
		
	fi

fi

for ((index=$NUM_START; $index<=$COUNT; index++));do

	DATANODE=$(sed "${index}!d" $BASE_DIR/datanode)
	DATANODE=$(echo $DATANODE | sed -e "s;\r;;g")

	echo "
--------------------------------------
       Node: hadoop@$DATANODE
--------------------------------------
	"

	# CONFIGURE SSH KEYS

	if [[ $ACTION == *"ssh"* ]]; then

		ssh-copy-id -i $HOME/.ssh/id_rsa.pub hadoop@$DATANODE

	fi

	# COPY ALL

	if [[ $ACTION == *"copy"* ]]; then
		ssh -t hadoop@$DATANODE 'rm -R /services; sudo mkdir /services; sudo chown hadoop:hadoop /services'
		scp -r /services hadoop@$DATANODE:/
	fi

	# COPY CONFIG FILES

	if [[ $ACTION == *"config"* ]]; then

		echo "######## CONFIG #########"

		# Config
		scp /services/* hadoop@$DATANODE:/services/;
		

		# Enviornments
		scp /services/.bashrc hadoop@$DATANODE:/services/;
		scp -rp /services/scripts hadoop@$DATANODE:/services/;
		ssh -t hadoop@$DATANODE 'sed -i -e "s/source\ \/services\/\.bashrc//g" /home/hadoop/.bashrc'
		ssh -t hadoop@$DATANODE 'sed -i "/^$/d" /home/hadoop/.bashrc && echo "source /services/.bashrc" >> /home/hadoop/.bashrc'

		# Hadoop config
		ssh -t hadoop@$DATANODE 'rm -r /services/hadoop/etc/hadoop/* && rm -r /services/hadoop/logs/*';
		scp -rp /services/hadoop/etc/hadoop/* hadoop@$DATANODE:/services/hadoop/etc/hadoop/;
		ssh -t hadoop@$DATANODE 'sed -e "s;%TEMPLATE_JAVA_HOME%;$JAVA_HOME;g" /services/hadoop/etc/hadoop/hadoop-env.template.sh > /services/hadoop/etc/hadoop/hadoop-env.sh'
		ssh -t hadoop@$DATANODE 'sudo chmod 777 -R /services/hdfs'

		# Spark config
		ssh -t hadoop@$DATANODE 'rm -r /services/spark/conf/* && rm -r /services/spark/logs/*';
		scp -rp /services/spark/conf/* hadoop@$DATANODE:/services/spark/conf/;
		ssh -t hadoop@$DATANODE "sed -e \"s;%TEMPLATE_JAVA_HOME%;\$JAVA_HOME;g\" -e \"s;%TEMPLATE_NAMENODE%;$TEMPLATE_NAMENODE;g\" /services/spark/conf/spark-env.template.sh > /services/spark/conf/spark-env.sh"

		# Hive config
		ssh -t hadoop@$DATANODE 'rm -r /services/hive/conf/* && rm -r /services/hive/logs/*';
		scp -rp /services/hive/conf/* hadoop@$DATANODE:/services/hive/conf/;

		# Hbase config
		ssh -t hadoop@$DATANODE 'rm -r /services/hbase/conf/* && rm -r /services/hbase/logs/*';
		scp -rp /services/hbase/conf/* hadoop@$DATANODE:/services/hbase/conf/;
		ssh -t hadoop@$DATANODE 'sed -e "s;%TEMPLATE_JAVA_HOME%;$JAVA_HOME;g" /services/hbase/conf/hbase-env.template.sh > /services/hbase/conf/hbase-env.sh'
		

	fi

	# CLEAR HDFS FILES

	if [[ $ACTION == *"clear"* ]]; then

		echo "######## CLEAR #########"
		
		# Clear datanode
		ssh -t hadoop@$DATANODE 'rm -r /services/hdfs/*';

	fi
	
done

echo "################# FINISH DATANODES LOOP ################# "

# CONFIGURE HDFS

if [[ $ACTION == *"dfs"* ]]; then

	/services/hadoop/bin/hdfs namenode -format
	/services/hadoop/sbin/start-dfs.sh
	/services/hadoop/bin/hdfs dfsadmin -safemode leave

	hdfs dfs -rm -R /tmp
	hdfs dfs -rm -R /user
	hdfs dfs -rm -R /hbase

	# Create paths in hdfs
	hdfs dfs -mkdir /tmp
	hdfs dfs -mkdir -p /user/hive/warehouse
	hdfs dfs -mkdir /hbase

	# Change permission in hdfs
	hdfs dfs -chmod g+w /tmp
	hdfs dfs -chmod g+w /user/hive/warehouse
	hdfs dfs -chmod g+w /hbase

fi
