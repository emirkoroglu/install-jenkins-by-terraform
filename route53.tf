# resource "aws_route53_record" "jenkins" {
#   zone_id = "Z0875892209G6JMLAI3PB"
#   name    = "jenkins.elonbitmusk.com"
#   type    = "A"
#   ttl     = "60"
#   records = [aws_instance.jenkins.public_ip]
# }

# resource "aws_instance" "jenkins" {
#   name               = "jenkins"
#   availability_zones = ["us-east-1a"]

#   listener {
#     instance_port     = 8080
#     instance_protocol = "http"
#   }
# }

resource "aws_route53_record" "jenkins" {
  zone_id = "Z0875892209G6JMLAI3PB"
  name    = "jenkins.elonbitmusk.com"
  type    = "A"

  alias {
    name                   = aws_s3_bucket.b.website_domain
    zone_id                = aws_s3_bucket.b.hosted_zone_id
    evaluate_target_health = false
  }
}