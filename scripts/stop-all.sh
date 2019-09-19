#!/bin/sh

BASE_DIR=/services/scripts

$BASE_DIR/stop-hbase.sh
$BASE_DIR/stop-hive.sh
$BASE_DIR/stop-spark.sh
$BASE_DIR/stop-hadoop.sh