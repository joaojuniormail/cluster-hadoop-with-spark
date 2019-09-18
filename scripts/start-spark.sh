#!/bin/sh

$SPARK_HOME/sbin/start-all.sh
$SPARK_HOME/sbin/start-history-server.sh

nohup jupyter notebook > /services/notebook.log &