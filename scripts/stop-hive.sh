#!/bin/sh

hive2_pid=`pgrep -f org.apache.hive.service.server.HiveServer2`
meta_pid=`pgrep -f org.apache.hadoop.hive.metastore.HiveMetaStore`

if [ ! -z "$hive2_pid" ]; then
    kill -9 $hive2_pid
    echo "kill HiveServer2 pid $hive2_pid"
fi

if [ ! -z "$meta_pid" ]; then
    kill -9 $meta_pid
    echo "kill HiveMetaStore pid $meta_pid"
fi

