resource "aws_s3_bucket" "tfer--ablackladytechblog-002E-com" {
  bucket        = "ablackladytechblog.com"
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
      "Resource": "arn:aws:s3:::ablackladytechblog.com/*",
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
    index_document = "index.html"
  }
}

resource "aws_s3_bucket" "tfer--www-002E-ablackladytechblog-002E-com" {
  bucket        = "www.ablackladytechblog.com"
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
      "Resource": "arn:aws:s3:::www.ablackladytechblog.com/*",
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
}
