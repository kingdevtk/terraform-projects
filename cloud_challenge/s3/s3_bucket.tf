resource "aws_s3_bucket" "tfer--trinatking-002E-com" {
  bucket        = "trinatking.com"
  force_destroy = "false"

  grant {
    id          = "2d1a4075a347cdb41a154eb6a2d4debe3b805b4711bb475f6d45f676ccae70f8"
    permissions = ["FULL_CONTROL"]
    type        = "CanonicalUser"
  }

  object_lock_enabled = "false"

  policy = <<POLICY
{
  "Id": "PolicyForCloudFrontPrivateContent",
  "Statement": [
    {
      "Action": "s3:GetObject",
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::cloudfront:user/CloudFront Origin Access Identity E1DPEDO85H0OYN"
      },
      "Resource": "arn:aws:s3:::trinatking.com/*",
      "Sid": "1"
    }
  ],
  "Version": "2008-10-17"
}
POLICY

  request_payer = "BucketOwner"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }

      bucket_key_enabled = "false"
    }
  }

  tags = {
    "trinatking.com" = "resume site"
  }

  tags_all = {
    "trinatking.com" = "resume site"
  }

  versioning {
    enabled    = "true"
    mfa_delete = "false"
  }

  website {
    index_document = "index.html"
  }
}

resource "aws_s3_bucket" "tfer--trinatking-tf-state" {
  bucket        = "trinatking-tf-state"
  force_destroy = "false"

  grant {
    id          = "2d1a4075a347cdb41a154eb6a2d4debe3b805b4711bb475f6d45f676ccae70f8"
    permissions = ["FULL_CONTROL"]
    type        = "CanonicalUser"
  }

  object_lock_enabled = "false"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": "s3:ListBucket",
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::438207642063:root"
      },
      "Resource": "arn:aws:s3:::trinatking-tf-state"
    },
    {
      "Action": [
        "s3:GetObject",
        "s3:PutObject",
        "s3:DeleteObject"
      ],
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::438207642063:root"
      },
      "Resource": [
        "arn:aws:s3:::trinatking-tf-state/api-gateway/",
        "arn:aws:s3:::trinatking-tf-state/cloudfront/",
        "arn:aws:s3:::trinatking-tf-state/dynamodb/",
        "arn:aws:s3:::trinatking-tf-state/lambda/",
        "arn:aws:s3:::trinatking-tf-state/route53/",
        "arn:aws:s3:::trinatking-tf-state/s3/"
      ]
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  request_payer = "BucketOwner"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }

      bucket_key_enabled = "true"
    }
  }

  versioning {
    enabled    = "true"
    mfa_delete = "false"
  }
}


resource "aws_s3_bucket" "tfer--www-002E-trinatking-002E-com" {
  bucket        = "www.trinatking.com"
  force_destroy = "false"

  grant {
    id          = "2d1a4075a347cdb41a154eb6a2d4debe3b805b4711bb475f6d45f676ccae70f8"
    permissions = ["FULL_CONTROL"]
    type        = "CanonicalUser"
  }

  object_lock_enabled = "false"

  policy = <<POLICY
{
  "Id": "PolicyForPublicWebsiteContent",
  "Statement": [
    {
      "Action": "s3:GetObject",
      "Effect": "Allow",
      "Principal": {
        "AWS": "*"
      },
      "Resource": "arn:aws:s3:::www.trinatking.com/*",
      "Sid": "PublicReadGetObject"
    }
  ],
  "Version": "2008-10-17"
}
POLICY

  request_payer = "BucketOwner"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }

      bucket_key_enabled = "false"
    }
  }

  versioning {
    enabled    = "true"
    mfa_delete = "false"
  }

  website {
    redirect_all_requests_to = "http://trinatking.com"
  }
}
