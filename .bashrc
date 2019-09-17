#### HADOOP

export HADOOP_HOME=/services/hadoop
export HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop
export HADOOP_MAPRED_HOME=$HADOOP_HOME 
export HADOOP_COMMON_HOME=$HADOOP_HOME
export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_HOME/lib/native
export HADOOP_HDFS_HOME=$HADOOP_HOME
export HADOOP_INSTALL=$HADOOP_HOME
export YARN_HOME=$HADOOP_HOME
export PATH=$PATH:$HADOOP_HOME/sbin:$HADOOP_HOME/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HADOOP_HOME/lib/native


#### SPARK

export SPARK_HOME=/services/spark
export PYSPARK_DRIVER_PYTHON=ipython
export PYSPARK_DRIVER_PYTHON_OPTS=""
export PATH=$PATH:$SPARK_HOME/bin



#### HIVE

export HIVE_HOME=/services/hive
export HIVE_CONF_DIR=$HIVE_HOME/conf
export PATH=$PATH:$HIVE_HOME/bin



#### HBASE

export HBASE_HOME=/services/hbase
export PATH=$PATH:$HBASE_HOME/bin



#### CONFIG MACHINE

export JAVA_HOME=$(readlink -e /usr/bin/java | sed "s:/bin/java::")
export MEMORY_RESOURCE=$(cat /proc/meminfo | head -2 | tail -1 | grep -oE '[0-9]+' | awk '{print $1/1024}')
export PATH=$PATH:$JAVA_HOME/bin
