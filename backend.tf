terraform {
  backend "s3" {
    bucket = "aft-corighose-tfstate"
    key    = "devops/infra.tfstate"
    region = "eu-west-2"
  }
}
