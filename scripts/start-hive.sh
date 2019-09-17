#!/bin/sh

BASE_DIR=/services/scripts

rm $HIVE_HOME/logs/*.log
rm $HIVE_HOME/logs/*.out

hive2_pid=`pgrep -f org.apache.hive.service.server.HiveServer2`
meta_pid=`pgrep -f org.apache.hadoop.hive.metastore.HiveMetaStore`

if [ ! -z "$hive2_pid" ]; then
    echo "org.apache.hive.service.server.HiveServer2 running as process $hive2_pid. Stop it first."
    exit;
fi

if [ ! -z "$meta_pid" ]; then
    echo "org.apache.hadoop.hive.metastore.HiveMetaStore running as process $meta_pid. Stop it first."
    exit;
fi

if [ ! -d "/services/metastore_db" ]; then
    $HIVE_HOME/bin/schematool -dbType derby -initSchema
fi

if [ -d "/services/metastore_db" ]; then
    #$HIVE_HOME/bin/hiveserver2 &
    nohup $HIVE_HOME/bin/hive --service metastore & >/dev/null &
    sleep 5
    nohup $HIVE_HOME/bin/hive --service hiveserver2 & >/dev/null &
    #$HIVE_HOME/bin/hive --service hiveserver2 --hiveconf hive.server2.thrift.port=10000 --hiveconf hive.root.logger=INFO,console
    #$HIVE_HOME/bin/hiveserver2 &
fi
