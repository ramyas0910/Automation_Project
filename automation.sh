me="ramya"



s3_bucket="upgrad-ramyas"



timestamp=$(date +%d%m%Y-%H%M%S)



sudo apt update -y


apt-get install apache2 -y


sudo systemctl status apache2



cd /var/log/apache2/


tar cvf /tmp/ramya-httpd-logs-$timestamp.tar *.log


aws s3 cp /tmp/${myname}-httpd-logs-${timestamp}.tar s3://${s3_bucket}/${myname}-httpd-logs-${timestamp}.tar

