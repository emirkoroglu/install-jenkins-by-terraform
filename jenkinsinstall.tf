resource "aws_instance" "jenkins" {
  ami           = data.aws_ami.centos.id
  instance_type = "t2.micro"
  key_name      = var.key_name
  # associate_public_ip_address = true
  availability_zone = "us-east-1a"
  # user_data = file("userdata.sh")

  vpc_security_group_ids = [aws_security_group.jenkinsecurity.id]

  #run jenkins.sh file
  # provisioner "file" {
  #   source      = "./jenkins.sh"
  #   destination = "/tmp/jenkins.sh"
  # }
  connection {
    type        = "ssh"
    user        = "centos"
    private_key = file("~/.ssh/id_rsa")
    host        = aws_instance.jenkins.public_ip
  }

  #run the following commands
  provisioner "remote-exec" {
    inline = [
      "sudo yum install -y jenkins java-11-openjdk-devel",
      "sudo yum -y install wget",
      "sudo wget --no-check-certificate -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo",
      "sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key",
      "sudo yum upgrade -y",
      "sudo yum install epel-release -y",
      "sudo yum install jenkins -y",
      "sudo systemctl start jenkins",
    ]
  }
  tags = {
    Name = "jenkins"
    Team = "DevOps"
  }
}