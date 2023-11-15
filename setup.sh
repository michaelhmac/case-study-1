#!/bin/bash 
#
# Setup file to install update GIT and install apache2 
# Will Git Clone my repo and mv file under /var/www/html location 

echo "+++ Upating GIT +++"
echo 
sudo apt update git -y 
echo 
echo "+++ Installing Apache2 +++"
echo 
sudo apt install apache2 -y
echo 
echo "+++ Enabling Apache on Startup +++" 
echo 
sudo systemctl enable apache2
echo 
echo "+++ Moivng all files and folder to /var/www/html +++"
echo 
sudo mv * .git /var/www/html
echo 
echo "+++ Checking if web page is up +++" 
URL=$(curl -s http://checkip.amazonaws.com)
timeout_seconds=10

if curl --output /dev/dull --silent --head --fail --max-time $timeout_seconds "$URL"; then 
    echo "The web page is up." 
else 
    echo "The web page is down or unreachable." 
fi


