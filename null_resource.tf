resource "null_resource" "myscript" {
  triggers = {
    always_run = timestamp()
  }
  provisioner "remote-exec" {
    inline = [
      "echo jenkins installation",
    ]
  }
  connection {
    type        = "ssh"
    user        = "centos"
    private_key = file("~/.ssh/id_rsa")
    host        = aws_instance.jenkins.public_ip
  }
}