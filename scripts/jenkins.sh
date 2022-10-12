#!/bin/bash -e
#Jenkins Install
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt install openjdk-11-jre -y
java -version
sudo apt-get install jenkins -y
sudo systemctl start jenkins.service
echo ##################################################
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
echo ##################################################

