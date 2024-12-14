resource "aws_s3_bucket" "drink" {
  bucket = "cloudskills-terraform-s3-bucket"

  tags = {
    Name        = "Cloudskills bucket"
    Environment = "Dev"
  }
}
resource "aws_s3_bucket" "teni" {
  bucket = "tenny-terraform-s3bucket"

  tags = {
    Name        = "tenny bucket"
    Environment = "Dev"
  }
}