#!/bin/sh

BASE_DIR=/services/scripts

$BASE_DIR/stop-all.sh
echo "Starting all services in 5 seconds"
sleep 5
echo "Start all services"
$BASE_DIR/start-all.sh