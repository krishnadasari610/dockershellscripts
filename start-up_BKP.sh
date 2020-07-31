#!/bin/bash


RAPISCAN_HOME=$HOME/rapiscan/
LOG_HOME=$RAPISCAN_HOME'logs'
#MALIBU_WEB_HOME=$RAPISCAN_HOME'malibu/apps/UI/malibu-web'
MAIN_APP_HOME=$RAPISCAN_HOME'malibu/apps/MainApp'
FILE_SERVICES_HOME=$RAPISCAN_HOME'malibu/apps/UI'

cd $FILE_SERVICES_HOME
screen -d -m npm start

cd $MAIN_APP_HOME
./MainApp DVDE935STRM --verbose --console



