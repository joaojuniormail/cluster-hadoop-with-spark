#!/bin/sh

rm $HADOOP_HOME/logs/*.log
rm $HADOOP_HOME/logs/*.out

$HADOOP_HOME/sbin/start-dfs.sh
$HADOOP_HOME/sbin/start-yarn.sh
#$HADOOP_HOME/bin/hdfs dfsadmin -safemode leave