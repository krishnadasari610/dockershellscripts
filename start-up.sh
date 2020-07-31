#!/bin/bash

set -o xtrace
echo "Argument :: $1"
RAPISCAN_HOME=$HOME/rapiscan/
LOG_HOME=$RAPISCAN_HOME'logs'
MAIN_APP_HOME=$RAPISCAN_HOME'malibu/apps/MainApp'
FILE_SERVICES_HOME=$RAPISCAN_HOME'malibu/apps/UI'

cd $FILE_SERVICES_HOME
screen -d -m npm start

cd $MAIN_APP_HOME
screen -d -m bash -c "echo $1 | ./MainApp DVDE935REPLAY --verbose --console"

printf '%s\n' $1 | ./MainApp DVDE935STRM --verbose --console




