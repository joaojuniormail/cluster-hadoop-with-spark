#!/bin/sh

#$SPARK_HOME/sbin/start-all.sh
$SPARK_HOME/sbin/start-history-server.sh

mkdir /services/spark/projects
nohup pyspark > /services/notebook.log &