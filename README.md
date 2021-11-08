# install-jenkins-by-terraform
This is Long Term Support release for Red Hat / CentOS

A LTS (Long-Term Support) release is chosen every 12 weeks from the stream of regular releases as the stable release for that time period. It can be installed from the redhat-stable yum repository.

Unlocking Jenkins
When you first access a new Jenkins instance, you are asked to unlock it using an automatically-generated password.

Browse to http://localhost:8080 (or whichever port you configured for Jenkins when installing it) and wait until the Unlock Jenkins page appears.

Note:

The command: sudo cat /var/lib/jenkins/secrets/initialAdminPassword will print the password at console.