#!/bin/sh

BASE_DIR=/services/scripts

$HBASE_HOME/bin/stop-hbase.sh
$BASE_DIR/stop-hive.sh
$BASE_DIR/stop-spark.sh
$BASE_DIR/stop-hadoop.sh