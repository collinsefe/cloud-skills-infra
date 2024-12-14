resource "aws_s3_bucket" "drink" {
  bucket = "cloudskills-terraform-s3-bucket-2"

  tags = {
    Name        = "Cloudskills bucket"
    Environment = "Dev"
  }
}

