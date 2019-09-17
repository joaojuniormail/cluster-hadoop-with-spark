#!/bin/sh

$SPARK_HOME/sbin/stop-all.sh

pid=$(pgrep -f jupyter)
kill -9 $pid