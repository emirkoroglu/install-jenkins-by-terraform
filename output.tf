# Shows AMI ID
output "Centos_ID" {
  value = data.aws_ami.centos.id
}
output "Jenkins_Public_IP" {
  value = aws_instance.jenkins.public_ip
}
output "Region" {
  value = "us-east-1"
}
output "Login_to_Jenkins" {
  value = aws_route53_record.jenkins.name
}
