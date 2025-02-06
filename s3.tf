# # This file contains the configuration for creating EC2 instances

resource "aws_s3_bucket" "foo" {
  bucket = "cloudskills-team-terraform-s3-bucket"
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        #  kms_master_key_id = "arn"
        sse_algorithm = "aws:kms"
      }
    }
  }
  logging {
    target_bucket = aws_s3_bucket.logging.id
  }
  versioning {
    enabled = true
  }
  tags = {
    Name        = "Cloudskills bucket - DO-NOT-DELETE"
    Environment = "Dev"
  }
}



resource "aws_s3_bucket" "logging" {
  bucket = "cloudskills-logging-bucket-05022025"
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        # kms_master_key_id = "arn"
        sse_algorithm = "aws:kms"
      }
    }
  }
  logging {
    target_bucket = aws_s3_bucket.logging.id
  }
  versioning {
    enabled = true
  }
  tags = {
    Name        = "cloudskills-logging-bucket-05022025"
    Environment = "demo"
  }
}


resource "aws_s3_bucket_public_access_block" "foo" {
  bucket                  = aws_s3_bucket.foo.id
  ignore_public_acls      = true
  restrict_public_buckets = true
  block_public_policy     = true
  block_public_acls       = true
}

resource "aws_s3_bucket_public_access_block" "logging" {
  bucket                  = aws_s3_bucket.logging.id
  ignore_public_acls      = true
  restrict_public_buckets = true
  block_public_policy     = true
  block_public_acls       = true
}