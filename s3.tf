resource "aws_s3_bucket" "this" {
  bucket = "cloudskills-project-s3-bucket"

  tags = {
    Name        = "cloudskills bucket"
    Environment = "Dev"
  }
}

