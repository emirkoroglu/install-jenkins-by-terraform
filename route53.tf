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