# #!/bin/bash
sudo yum install wget -y

sudo yum install git -y

sudo yum install unzip -y

sudo wget --no-check-certificate -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo

sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key

sudo yum upgrade -y

sudo yum install epel-release java-11-openjdk-devel -y

sudo yum install jenkins -y

sudo systemctl daemon-reload

sudo systemctl start jenkins

sudo systemctl status jenkins
