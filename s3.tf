resource "aws_s3_bucket" "drink" {
  bucket = "kwam-terraform-s3bucket"

  tags = {
    Name        = "Kwam bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket" "food" {
  bucket = "collinsefe-terraform-s3bucket-09087654q"

  tags = {
    Name        = "Collins bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket" "coke" {
  bucket = "tennie-terraform-s3bucket-09087654q"

  tags = {
    Name        = "Tennie bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket" "fanta" {
  bucket = "bimbo-terraform-s3bucket-09087654q"

  tags = {
    Name        = "Bimbo bucket"
    Environment = "Dev"
  }
}

