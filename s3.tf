resource "aws_s3_bucket" "drink" {
  bucket = "cloudskills-terraform-s3-bucket"

  tags = {
    Name        = "Cloudskills bucket"
    Environment = "Dev"
  }
}
