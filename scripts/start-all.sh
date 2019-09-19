#!/bin/sh

BASE_DIR=/services/scripts

$BASE_DIR/start-hadoop.sh
$BASE_DIR/start-spark.sh
$BASE_DIR/start-hive.sh
$BASE_DIR/start-hbase.sh