#!/bin/sh

$SPARK_HOME/sbin/start-all.sh
#$SPARK_HOME/sbin/start-history-server.sh

mkdir /services/spark/projects

pid=$(pgrep -f jupyter)

if [ -z "$pid" ]; then
    nohup pyspark > /services/notebook.log &
fi