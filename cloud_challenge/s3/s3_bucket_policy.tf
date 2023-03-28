resource "aws_s3_bucket_policy" "tfer--trinatking-002E-com" {
  bucket = "trinatking.com"
  policy = "{\"Id\":\"PolicyForCloudFrontPrivateContent\",\"Statement\":[{\"Action\":\"s3:GetObject\",\"Effect\":\"Allow\",\"Principal\":{\"AWS\":\"arn:aws:iam::cloudfront:user/CloudFront Origin Access Identity E1DPEDO85H0OYN\"},\"Resource\":\"arn:aws:s3:::trinatking.com/*\",\"Sid\":\"1\"}],\"Version\":\"2008-10-17\"}"
}

resource "aws_s3_bucket_policy" "tfer--trinatking-tf-state" {
  bucket = "trinatking-tf-state"
  policy = "{\"Statement\":[{\"Action\":\"s3:ListBucket\",\"Effect\":\"Allow\",\"Principal\":{\"AWS\":\"arn:aws:iam::438207642063:root\"},\"Resource\":\"arn:aws:s3:::trinatking-tf-state\"},{\"Action\":[\"s3:GetObject\",\"s3:PutObject\",\"s3:DeleteObject\"],\"Effect\":\"Allow\",\"Principal\":{\"AWS\":\"arn:aws:iam::438207642063:root\"},\"Resource\":[\"arn:aws:s3:::trinatking-tf-state/api-gateway/\",\"arn:aws:s3:::trinatking-tf-state/cloudfront/\",\"arn:aws:s3:::trinatking-tf-state/dynamodb/\",\"arn:aws:s3:::trinatking-tf-state/lambda/\",\"arn:aws:s3:::trinatking-tf-state/route53/\",\"arn:aws:s3:::trinatking-tf-state/s3/\"]}],\"Version\":\"2012-10-17\"}"
}

resource "aws_s3_bucket_policy" "tfer--www-002E-trinatking-002E-com" {
  bucket = "www.trinatking.com"
  policy = "{\"Id\":\"PolicyForPublicWebsiteContent\",\"Statement\":[{\"Action\":\"s3:GetObject\",\"Effect\":\"Allow\",\"Principal\":{\"AWS\":\"*\"},\"Resource\":\"arn:aws:s3:::www.trinatking.com/*\",\"Sid\":\"PublicReadGetObject\"}],\"Version\":\"2008-10-17\"}"
}
