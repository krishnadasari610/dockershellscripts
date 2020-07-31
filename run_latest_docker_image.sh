#! /bin/bash

#Build the MainApp image based on dockerfile instructions
#docker build -t mainapp-execution .

#get the image id 
#latestimage=$(docker images | sed -n '2p' | sed 's/\([^ ]\+\) *\([^ ]\+\) *\([^ ]\+\).*/\3/g')

# Get the Repository name and store the value into latestimage  
latestimage=$(docker images | sed -n '2p' | sed 's/\([^ ]\+\) .*/\1/g')

# Run the latest image
echo "Running the recent docker image" 
nvidia-docker run --rm -it --name=bio-vol -v /home/admin/rapiscan/malibu/archive:/home/admin/rapiscan/malibu/archive -v /home/admin/rapiscan/malibu/output:/home/admin/rapiscan/malibu/output -v /home/admin/rapiscan/logs:/home/admin/rapiscan/logs  -v /mnt/rtt_array:/mnt/rtt_array -p 8081:8081 -p 8888:8888 -p 5000:5000 $latestimage /bin/bash

