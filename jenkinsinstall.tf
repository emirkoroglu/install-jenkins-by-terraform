resource "aws_instance" "jenkins" {
  ami           = data.aws_ami.centos.id
  instance_type = "t3.micro"
  key_name      = aws_key_pair.bastion_host3.key_name
  # associate_public_ip_address = true
  availability_zone = "ap-northeast-1a"

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
  provisioner "remote-exec" {
    inline = [
      "sudo rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key",
      "sudo yum upgrade -y",
      "sudo yum install epel-release java-11-openjdk-develsudo yum install epel-release java-11-openjdk-devel -y",
      "sudo yum install jenkins",
      "sudo systemctl start jenkins",
    ]
  }

  tags = {
    Name = "jenkins"
  }
}
