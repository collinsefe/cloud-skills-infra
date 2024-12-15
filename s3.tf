resource "aws_s3_bucket" "drink" {
  bucket = "cloudskills-terraform-s3-bucket"

  tags = {
    Name        = "Cloudskills bucket"
    Environment = "Dev"
  }
}

# resource "aws_s3_bucket" "teni" {
#   bucket = "tenny-terraform-s3bucket"
#   tags = {
#     Name        = "tenny bucket"
#      Environment = "Dev"
#   }
# }


# resource "aws_s3_bucket" "kwamdeen" {
#   bucket = "kwamdeen-terraform-s3bucket"

#   tags = {
#     Name        = "Kwamdeen Ayinla bucket"
#     Environment = "Dev"
#   }
# }


# resource "aws_s3_bucket" "example" {
#   bucket        = "teni-s3-bucket" 

#   tags = {
#     Name        = "MyBucket"
#     Environment = "Dev"
#   }
# }
