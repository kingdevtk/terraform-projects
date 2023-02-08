module "s3_bucket" {
  source  = "cloudposse/s3-bucket/aws"
  version = "2.0.1"
  # https://registry.terraform.io/modules/cloudposse/s3-bucket/aws/2.0.1

  bucket_name             = var.bucket_name
  acl                     = "private"
  allow_ssl_requests_only = true
  enabled                 = true
  sse_algorithm           = "aws:kms"
  tags                    = var.tags
  user_enabled            = false
  versioning_enabled      = true
}
