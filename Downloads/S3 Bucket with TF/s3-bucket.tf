provider "aws" {
  profile = "692859905059_AWSPowerUserAccess"
  region = "eu-west-2" 
}

resource "aws_s3_bucket" "example" {
  bucket        = "tennie-s3-bucket" 

  tags = {
    Name        = "MyBucket"
    Environment = "Dev"
  }
}
