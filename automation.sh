me="ramya"



s3_bucket="upgrad-ramyas"



timestamp=$(date +%d%m%Y-%H%M%S)



sudo apt update -y


apt-get install apache2 -y


sudo systemctl status apache2



cd /var/log/apache2/


tar cvf /tmp/ramya-httpd-logs-$timestamp.tar *.log


aws s3 cp /tmp/${myname}-httpd-logs-${timestamp}.tar s3://${s3_bucket}/${myname}-httpd-logs-${timestamp}.tar

if [ ! -f /var/www/html/inventory.html ]
then
	        :
	else
		        touch /var/www/html/inventory.html
			        echo -e "Log Type\tDate Created\t Type\tSize" >> /var/www/html/inventory.html
fi

FILENAME=/root/Automation_Project/automation.sh
FILESIZE=$(stat -c%s "$FILENAME")
#echo "Size of $FILENAME = $FILESIZE bytes."

echo -e "httpd-logs\t$timestamp\t tar\t$FILESIZE" >> /var/www/html/inventory.html

if [ ! -f /etc/cron.d/automation ]
then
	:
else
	touch /etc/cron.d/automation
	echo -e "0 0 * * * /root/Automation_Project/automation.sh" >> /etc/cron.d/automation
fi

