resource "aws_s3_bucket" "b" {
  bucket = "jenkins.elonbitmusk.com"
  acl           = "private"

  versioning {
    enabled = true
  }

  website {
    redirect_all_requests_to = "3.89.101.78:8080"
  }
}