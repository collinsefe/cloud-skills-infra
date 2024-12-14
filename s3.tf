resource "aws_s3_bucket" "drink" {
  bucket = "cloudskills-terraform-s3-bucket"

  tags = {
    Name        = "Cloudskills bucket"
    Environment = "Dev"
  }
}


resource "aws_s3_bucket" "kwamdeen" {
  bucket = "kwamdeen-terraform-s3bucket"

  tags = {
    Name        = "Kwamdeen Ayinla bucket"
    Environment = "Dev"
  }
}