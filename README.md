# install-jenkins-by-terraform --- Red Hat / CentOS --
This is Long Term Support release for Red Hat / CentOS

A LTS (Long-Term Support) release is chosen every 12 weeks from the stream of regular releases as the stable release for that time period. It can be installed from the redhat-stable yum repository.

Unlocking Jenkins
When you first access a new Jenkins instance, you are asked to unlock it using an automatically-generated password.

Browse to http://localhost:8080 (or whichever port you configured for Jenkins when installing it) and wait until the Unlock Jenkins page appears.

Note:

Admin Login Password;
sudo cat /var/lib/jenkins/secrets/initialAdminPassword


# Install Script Only For Red Hat / CentOS

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
