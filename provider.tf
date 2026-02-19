terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws" # connecting to aws provider
      version = "6.33.0" # terraform aws provider version
    }
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"

  # access and secret keys has given in aws configure no need to mention here because terraform will get the keys from aws configure
}