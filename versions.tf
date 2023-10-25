terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.21"
    }
  }
}

provider "aws" {
  profile = "backyard"
  region  = "us-east-1"
}