provider "aws" {
  region = "us-east-1"
}

terraform {
  required_providers {
    aws = {
      version = "~> 4.10.0"
    }
    backend "s3" {
      bucket = "trinatking-tf-state"
      key    = "api-gateway"
      region = "us-east-1"
    }
  }
}
