
resource "aws_s3_bucket" "example" {
  bucket        = "teni-s3-bucket" 

  tags = {
    Name        = "MyBucket"
    Environment = "Dev"
  }
}
