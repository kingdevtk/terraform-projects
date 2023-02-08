provider "aws" {}

terraform {
	required_providers {
		aws = {
	    version = "~> 4.10.0"
		}
  }
}
