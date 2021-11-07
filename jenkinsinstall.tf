resource "aws_instance" "jenkins" {
  ami           = data.aws_ami.centos.id
  instance_type = "m5.large"
  key_name      = var.key_name
  # associate_public_ip_address = true
  availability_zone = "us-east-1a"

  vpc_security_group_ids = [aws_security_group.jenkinsecurity.id]

  #run jenkins.sh file
  provisioner "file" {
    source      = "./jenkins.sh"
    destination = "/tmp/jenkins.sh"
  }
  connection {
    type        = "ssh"
    user        = "centos"
    private_key = file("~/.ssh/id_rsa")
    host        = aws_instance.jenkins.public_ip
  }

  # run the following commands
  # provisioner "remote-exec" {
  #   inline = [
  #     "wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins.io/redhat-stable/jenkins.repo",
  #     "sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key",
  #     "sudo yum upgrade -y",
  #     "sudo yum install epel-release java-11-openjdk-devel -y",
  #     "sudo yum install jenkins -y",
  #     "sudo systemctl daemon-reload",
  #     "sudo systemctl start jenkins",
  #     "sudo systemctl enable jenkins",
  #   ]
  # }
  # tags = {
  #   Name = "jenkins"
  # }
}