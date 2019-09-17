#!/bin/sh

$SPARK_HOME/sbin/start-all.sh

nohup pyspark & >/dev/null &