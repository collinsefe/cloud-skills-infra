terraform {
  backend "s3" {
    bucket = "terraform-tfstate-bucket-01122024"
    key    = "june2025/collins/ec2.tfstate"
    region = "eu-west-2"
  }
}
