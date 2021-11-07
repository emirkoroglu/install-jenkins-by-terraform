# Shows AMI ID
output "CENTOS_ID" {
  value = data.aws_ami.centos.id
}
output "Host_Address" {
  value = aws_instance.jenkins.public_ip
}
output "region" {
  value = "ap-northeast-1"
}
output "records" {
  value = aws_route53_record.jenkins.records
}