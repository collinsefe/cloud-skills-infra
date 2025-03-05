
resource "aws_s3_bucket" "example" {
  bucket = "collinsefenewdemos3website"

  tags = {
    Name        = "My demo bucket"
    Environment = "Demo"
  }
}

# create s3 static website 
resource "aws_s3_bucket_website_configuration" "example" {
  bucket = aws_s3_bucket.example.id

  index_document {
    suffix = "index.html"

  }
}

# upload file to s3 bucket
resource "aws_s3_bucket_object" "object" {
  bucket = "collinsefenewdemos3website"
  key    = "index.html"
  source = "path/to/file"

  # The filemd5() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the md5() function and the file() function:
  # etag = "${md5(file("path/to/file"))}"
  etag = filemd5("path/to/file")
}