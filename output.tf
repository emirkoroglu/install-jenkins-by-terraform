output "Jenkins_Host_Public_IP" {
  value = aws_instance.jenkins.public_ip
}
output "Region" {
  value = "us-east-1"
}
output "Login_to_Jenkins" {
  value = aws_route53_record.jenkins.name
}
output "Jenkins_Username_Password" {
  value = "emirsway-52b6210a5bac483392edcd5920f09d69"
}