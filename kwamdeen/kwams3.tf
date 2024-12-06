resource "aws_s3_bucket" "bucket-1" {
  bucket = "kwam-terraform-s3bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

