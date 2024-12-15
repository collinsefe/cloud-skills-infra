resource "aws_s3_bucket" "drink" {
  bucket = "cloudskills-terraform-s3-bucket"

  tags = {
    Name        = "Cloudskills bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket" "dev-1" {
  bucket = "cloudskills-developer-1-s3-bucket"

  tags = {
    Name        = "Developer 1 bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket" "dev-2" {
  bucket = "cloudskills-developer-2-s3-bucket"

  tags = {
    Name        = "Developer 2 bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket" "kwamdeen" {
  bucket = "cloudskills-developer-2-s3-bucket-kwamdeen"

  tags = {
    Name        = "Developer kwamdeen bucket"
    Environment = "Dev"
  }
}
    

resource "aws_s3_bucket" "fish" {
  bucket = "cloudskills-collins-2-s3-bucket"

  tags = {
    Name        = "Collins bucket"
    Environment = "Dev"
  }
}




