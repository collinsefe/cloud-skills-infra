# # # This file contains the configuration for creating EC2 instances
resource "aws_s3_bucket" "example" {
  bucket = "my-okhai-test-bucket-202506021800"

  tags = {
    Name        = "my-okhai-test-bucket-202506021800"
    Environment = "Dev"
  }
}


resource "aws_s3_bucket" "example-2" {
  bucket = "collins-efe-test-bucket-202506021800"

  tags = {
    Name        = "collins-efe-test-bucket-202506021800"
    Environment = "Dev"
  }
}