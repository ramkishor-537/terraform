terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.33.0" # Terraform AWS provider version
    }
  }

  backend "s3" {
    bucket  = "remote-state-aws-88s" # Replace with your unique bucket name
    key     = "remote-state.tfstate" # key should be different from one person to another person bucket can be same 
    region  = "us-east-1"
    encrypt = true
    use_lockfile   = true
  }

  # when terraform init command runs
  # terraform will understand that i should not store state file locally
  # instead i should access this s3 bucket and store the state in this file : "remote-state.tfstate"
}

provider "aws" {
  region = "us-east-1"
}