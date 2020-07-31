FROM 935dv-configured:latest

#copy all files to destination directory 
COPY . $MALIBU_SETUP_SCRIPTS_DIRECTORY

#RUN ls -lrth $MALIBU_SETUP_SCRIPTS_DIRECTORY
#Assigning Owner permissions to destination directory
RUN chown -hR $ZICONS_USERNAME:$ZICONS_USERNAME $MALIBU_SETUP_SCRIPTS_DIRECTORY
#Folder permissions provided 
RUN chmod -R +x $MALIBU_SETUP_SCRIPTS_DIRECTORY
#RUN ls -l $MALIBU_SETUP_SCRIPTS_DIRECTORY
#USER NAME
USER $ZICONS_USERNAME

RUN $MALIBU_SETUP_SCRIPT 

WORKDIR $RAPISCAN_HOME/malibu/apps/UI/file-services
RUN npm install
WORKDIR $RAPISCAN_HOME/malibu/apps/UI
RUN npm install
EXPOSE 8888 8081 5000 13251/udp 

ENTRYPOINT ["sh", "/home/admin/project/start-up.sh"]
