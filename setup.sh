#!/bin/bash 
#
# Setup file to install update GIT and install apache2 
# Will Git Clone my repo and mv file under /var/www/html location 

echo "+++ Upating GIT +++"
echo 
sudo apt update git 
echo 
echo "+++ Installing Apache2 +++"
echo 
sudo apt install apache2 -y
echo 
echo "+++ Moivng all files and folder to /var/www/html +++"
echo 
sudo mv * .git /var/www/html
echo 
echo "+++ Checking if web page is up +++" 

url=$(curl -s http://checkip.amazonaws.com)
timeout_seconds=5

response_code=$(curl --output /dev/null --silent --head --fail --max-time $timeout_seconds -w "%{http_code}" "$url")

if [ "$response_code" -eq 200 ]; then
    echo "The web page is up (HTTP 200 OK)."
else
    echo "The web page is down or unreachable (HTTP $response_code)."
fi








