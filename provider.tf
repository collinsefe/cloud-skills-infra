terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  #profile = "692859905059_AWSPowerUserAccess"
  region = "eu-west-2"
}
