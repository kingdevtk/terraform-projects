resource "aws_s3_bucket_policy" "tfer--ablackladytechblog-002E-com" {
  bucket = "ablackladytechblog.com"
  policy = "{\"Id\":\"PolicyForPublicWebsiteContent\",\"Statement\":[{\"Action\":\"s3:GetObject\",\"Effect\":\"Allow\",\"Principal\":{\"AWS\":\"*\"},\"Resource\":\"arn:aws:s3:::ablackladytechblog.com/*\",\"Sid\":\"PublicReadGetObject\"}],\"Version\":\"2008-10-17\"}"
}

resource "aws_s3_bucket_policy" "tfer--codepipeline-us-east-1-523599582413" {
  bucket = "codepipeline-us-east-1-523599582413"
  policy = "{\"Id\":\"SSEAndSSLPolicy\",\"Statement\":[{\"Action\":\"s3:PutObject\",\"Condition\":{\"StringNotEquals\":{\"s3:x-amz-server-side-encryption\":\"aws:kms\"}},\"Effect\":\"Deny\",\"Principal\":\"*\",\"Resource\":\"arn:aws:s3:::codepipeline-us-east-1-523599582413/*\",\"Sid\":\"DenyUnEncryptedObjectUploads\"},{\"Action\":\"s3:*\",\"Condition\":{\"Bool\":{\"aws:SecureTransport\":\"false\"}},\"Effect\":\"Deny\",\"Principal\":\"*\",\"Resource\":\"arn:aws:s3:::codepipeline-us-east-1-523599582413/*\",\"Sid\":\"DenyInsecureConnections\"}],\"Version\":\"2012-10-17\"}"
}

resource "aws_s3_bucket_policy" "tfer--trinatking-002E-com" {
  bucket = "trinatking.com"
  policy = "{\"Id\":\"PolicyForCloudFrontPrivateContent\",\"Statement\":[{\"Action\":\"s3:GetObject\",\"Effect\":\"Allow\",\"Principal\":{\"AWS\":\"arn:aws:iam::cloudfront:user/CloudFront Origin Access Identity E1DPEDO85H0OYN\"},\"Resource\":\"arn:aws:s3:::trinatking.com/*\",\"Sid\":\"1\"}],\"Version\":\"2008-10-17\"}"
}

resource "aws_s3_bucket_policy" "tfer--www-002E-ablackladytechblog-002E-com" {
  bucket = "www.ablackladytechblog.com"
  policy = "{\"Id\":\"PolicyForPublicWebsiteContent\",\"Statement\":[{\"Action\":\"s3:GetObject\",\"Effect\":\"Allow\",\"Principal\":{\"AWS\":\"*\"},\"Resource\":\"arn:aws:s3:::www.ablackladytechblog.com/*\",\"Sid\":\"PublicReadGetObject\"}],\"Version\":\"2008-10-17\"}"
}

resource "aws_s3_bucket_policy" "tfer--www-002E-trinatking-002E-com" {
  bucket = "www.trinatking.com"
  policy = "{\"Id\":\"PolicyForPublicWebsiteContent\",\"Statement\":[{\"Action\":\"s3:GetObject\",\"Effect\":\"Allow\",\"Principal\":{\"AWS\":\"*\"},\"Resource\":\"arn:aws:s3:::www.trinatking.com/*\",\"Sid\":\"PublicReadGetObject\"}],\"Version\":\"2008-10-17\"}"
}
