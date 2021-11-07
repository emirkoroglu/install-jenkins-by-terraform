resource "aws_route53_record" "jenkins" {
  zone_id = "Z0875892209G6JMLAI3PB"
  name    = "jenkins.elonbitmusk.com"
  type    = "A"
  ttl     = "100"
  records = [aws_instance.jenkins.public_ip]
}