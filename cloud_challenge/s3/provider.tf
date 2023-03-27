# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

# Configure Terraform
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

terraform {
  backend "s3" {
    bucket = "trinatking-tf-state"
    key    = "trinatking-tf-state/s3/terraform.tfstate"
    region = "us-east-1"
  }
}
