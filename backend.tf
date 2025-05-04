terraform {
  backend "s3" {
    bucket = "terraform-tfstate-bucket-01122024"
    key    = "devops/infra.tfstate"
    region = "eu-west-2"
  }
}
