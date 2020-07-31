# UBUNTU latest file
FROM ubuntu:18.04

# Install and update the SUDO & utils
RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt-get install -y sudo libpython2.7 python2.7 libxml2
RUN apt-get install -y curl screen vim
RUN curl -sL https://deb.nodesource.com/setup_13.x | sudo -E bash -
RUN apt-get install -y nodejs



