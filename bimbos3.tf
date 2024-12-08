resource "aws_s3_bucket" "bucket-1" {
  bucket = "bimbo-s3bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

