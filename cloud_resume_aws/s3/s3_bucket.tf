resource "aws_s3_bucket" "tfer--ablackladytechblog-002E-com" {
  arn           = "arn:aws:s3:::ablackladytechblog.com"
  bucket        = "ablackladytechblog.com"
  force_destroy = "false"

  grant {
    id          = "2d1a4075a347cdb41a154eb6a2d4debe3b805b4711bb475f6d45f676ccae70f8"
    permissions = ["FULL_CONTROL"]
    type        = "CanonicalUser"
  }

  hosted_zone_id      = "Z3AQBSTGFYJSTF"
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

  versioning {
    enabled    = "true"
    mfa_delete = "false"
  }

  website {
    index_document = "index.html"
  }
}

resource "aws_s3_bucket" "tfer--codepipeline-us-east-1-523599582413" {
  arn           = "arn:aws:s3:::codepipeline-us-east-1-523599582413"
  bucket        = "codepipeline-us-east-1-523599582413"
  force_destroy = "false"

  grant {
    id          = "2d1a4075a347cdb41a154eb6a2d4debe3b805b4711bb475f6d45f676ccae70f8"
    permissions = ["FULL_CONTROL"]
    type        = "CanonicalUser"
  }

  hosted_zone_id      = "Z3AQBSTGFYJSTF"
  object_lock_enabled = "false"

  policy = <<POLICY
{
  "Id": "SSEAndSSLPolicy",
  "Statement": [
    {
      "Action": "s3:PutObject",
      "Condition": {
        "StringNotEquals": {
          "s3:x-amz-server-side-encryption": "aws:kms"
        }
      },
      "Effect": "Deny",
      "Principal": "*",
      "Resource": "arn:aws:s3:::codepipeline-us-east-1-523599582413/*",
      "Sid": "DenyUnEncryptedObjectUploads"
    },
    {
      "Action": "s3:*",
      "Condition": {
        "Bool": {
          "aws:SecureTransport": "false"
        }
      },
      "Effect": "Deny",
      "Principal": "*",
      "Resource": "arn:aws:s3:::codepipeline-us-east-1-523599582413/*",
      "Sid": "DenyInsecureConnections"
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  request_payer = "BucketOwner"

  versioning {
    enabled    = "false"
    mfa_delete = "false"
  }
}

resource "aws_s3_bucket" "tfer--trinatking-002E-com" {
  arn           = "arn:aws:s3:::trinatking.com"
  bucket        = "trinatking.com"
  force_destroy = "false"

  grant {
    id          = "2d1a4075a347cdb41a154eb6a2d4debe3b805b4711bb475f6d45f676ccae70f8"
    permissions = ["FULL_CONTROL"]
    type        = "CanonicalUser"
  }

  hosted_zone_id      = "Z3AQBSTGFYJSTF"
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

resource "aws_s3_bucket" "tfer--www-002E-ablackladytechblog-002E-com" {
  arn           = "arn:aws:s3:::www.ablackladytechblog.com"
  bucket        = "www.ablackladytechblog.com"
  force_destroy = "false"

  grant {
    id          = "2d1a4075a347cdb41a154eb6a2d4debe3b805b4711bb475f6d45f676ccae70f8"
    permissions = ["FULL_CONTROL"]
    type        = "CanonicalUser"
  }

  hosted_zone_id      = "Z3AQBSTGFYJSTF"
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

  versioning {
    enabled    = "true"
    mfa_delete = "false"
  }
}

resource "aws_s3_bucket" "tfer--www-002E-trinatking-002E-com" {
  arn           = "arn:aws:s3:::www.trinatking.com"
  bucket        = "www.trinatking.com"
  force_destroy = "false"

  grant {
    id          = "2d1a4075a347cdb41a154eb6a2d4debe3b805b4711bb475f6d45f676ccae70f8"
    permissions = ["FULL_CONTROL"]
    type        = "CanonicalUser"
  }

  hosted_zone_id      = "Z3AQBSTGFYJSTF"
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

  versioning {
    enabled    = "true"
    mfa_delete = "false"
  }

  website {
    redirect_all_requests_to = "http://trinatking.com"
  }
}
