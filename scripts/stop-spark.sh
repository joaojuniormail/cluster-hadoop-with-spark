#!/bin/sh

$SPARK_HOME/sbin/stop-all.sh

pid=$(pgrep -f jupyter)

if [ ! -z "$pid" ]; then
    kill -9 $pid
fi