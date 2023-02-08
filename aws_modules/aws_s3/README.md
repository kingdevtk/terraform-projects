  # AWS S3 (Simple Storage Service Terraform Module

This module is responsible for creating and configuring an S3 bucket in AWS in compliance with company standards.

## What does this module do?
----------------------------
This module creates the following resources in the targeted AWS account:
- Amazon S3 bucket

## Module Variables
-------------------
### Required Variables
**region**
- the AWS region that the module will be deployed in
- *type*: string

**bucket_name**
- the name of the bucket
- *type*: string

### Optional Variables
**tags**
- a map of tags that will get applied to the bucket
- *type*: map(string)

## Module Outputs
-------------------
**bucket_arn**
- the arn of the bucket

**bucket_name**
- the name of the bucket

## Module Usage
---------------
```
module "kingdevtk_s3_bucket" {
  source  = "spacelift.io/kingdevtktheapp/terraform-aws-s3/aws"
  version = "1.0.0"

  region      = "us-east-1"
  bucket_name = "kingdevtk-use1-dev-bucket"
  tags = {
    Environment = "dev"
  }
```
