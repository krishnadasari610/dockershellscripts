FROM dvd935-barebones:latest


# Declaring username using Environment variables
ENV ZICONS_USERNAME admin
#ENV ZICONS_PASSWORD rapi@123
#Assigning directories to Environment variables
ENV USER_ACCOUNTS_HOME_DIRECTORY /home
ENV RAPISCAN_HOME $USER_ACCOUNTS_HOME_DIRECTORY/$ZICONS_USERNAME
ENV MALIBU_SETUP_SCRIPTS_DIRECTORY $RAPISCAN_HOME/project
ENV MALIBU_SETUP_SCRIPT $MALIBU_SETUP_SCRIPTS_DIRECTORY/malibu_libraries.sh
ENV RAPISCAN_HOME /home/admin/rapiscan
ENV WORK_DIRECTORY /home/admin/rapiscan/malibu/apps/MainApp
ENV UDPPORT 13251


#Adding user 
RUN useradd -m $ZICONS_USERNAME
#Assigning SUDO access to USER
RUN adduser $ZICONS_USERNAME sudo
#Creating directory to copy required libraries
RUN mkdir $MALIBU_SETUP_SCRIPTS_DIRECTORY
