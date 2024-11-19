terraform {
  backend "s3" {
    bucket = "terraform-tfstate-0030004072"
    key    = "devops/class03/infra.tfstate"
    region = "eu-west-2"
  }
}
