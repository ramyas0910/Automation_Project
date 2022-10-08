# Automation_Project

This is a bash automation script to install apache2 server on an ubuntu EC2 instance on AWS cloud

# Prerequisistes
1. Create an Ubuntu server EC2 instance
2. Create a s3 bucket
3. Create an IAM role with "S3FullAccess" role. This needs to be attached to the EC2 instance
4. Create a security group for the EC2 instance and allow these inbound ports: 80,443,22
5. AWS CLI installed on the Ubuntu EC2 instance
6. Sudo access

# Script function
THe "Automation.sh" script will run and execute the commands to achieve the following
1. Update the existing Ubuntu packages
2. Install apache2 server
3. Check if apache2 server is running successully
4. Creates a .tar archive of the apache 2 logs present the in the directory /var/log/apache2/
5. Copies the tar archive file to the s3 bucket
