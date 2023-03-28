resource "aws_s3_bucket_policy" "tfer--ablackladytechblog-002E-com" {
  bucket = "ablackladytechblog.com"
  policy = "{\"Id\":\"PolicyForPublicWebsiteContent\",\"Statement\":[{\"Action\":\"s3:GetObject\",\"Effect\":\"Allow\",\"Principal\":{\"AWS\":\"*\"},\"Resource\":\"arn:aws:s3:::ablackladytechblog.com/*\",\"Sid\":\"PublicReadGetObject\"}],\"Version\":\"2008-10-17\"}"
}

resource "aws_s3_bucket_policy" "tfer--www-002E-ablackladytechblog-002E-com" {
  bucket = "www.ablackladytechblog.com"
  policy = "{\"Id\":\"PolicyForPublicWebsiteContent\",\"Statement\":[{\"Action\":\"s3:GetObject\",\"Effect\":\"Allow\",\"Principal\":{\"AWS\":\"*\"},\"Resource\":\"arn:aws:s3:::www.ablackladytechblog.com/*\",\"Sid\":\"PublicReadGetObject\"}],\"Version\":\"2008-10-17\"}"
}
