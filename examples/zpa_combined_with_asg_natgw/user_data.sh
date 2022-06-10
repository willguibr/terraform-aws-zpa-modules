#!/usr/bin/bash
sudo yum install unzip -y
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o /tmp/awscli-exe-linux-x86_64.zip
unzip /tmp/awscli-exe-linux-x86_64.zip -d /tmp
sudo /tmp/aws/install
REGION=$(curl http://169.254.169.254/latest/meta-data/placement/region)
URL="http://169.254.169.254/latest/meta-data/network/interfaces/macs/"
MAC=$(curl $URL)
URL=$URL$MAC"vpc-id/"
VPC=$(curl $URL)
key="ZSDEMO"

#Stop the App Connector service which was auto-started at boot time
sudo systemctl stop zpa-connector

# Create provisioning key file
sudo touch /opt/zscaler/var/provision_key
sudo chmod 644 /opt/zscaler/var/provision_key
sudo chown admin:admin /opt/zscaler/var/ -R

# Retrieve and Decrypt Provisioning Key from Parameter Store
aws ssm get-parameter --name $key --query Parameter.Value --with-decryption --region $REGION | tr -d '"' > /opt/zscaler/var/provision_key

#Run a yum update to apply the latest patches
sudo yum update -y
#Start the App Connector service to enroll it in the ZPA cloud
sudo systemctl start zpa-connector
#Wait for the App Connector to download latest build
sudo sleep 60
#Stop and then start the App Connector for the latest build
sudo systemctl stop zpa-connector
sudo systemctl start zpa-connector