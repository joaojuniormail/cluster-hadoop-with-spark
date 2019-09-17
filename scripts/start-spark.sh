#!/bin/sh

$SPARK_HOME/sbin/start-all.sh

pyspark &>dev/null &