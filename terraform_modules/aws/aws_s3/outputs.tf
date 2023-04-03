output "bucket_arn" {
  description = "the arn of the bucket"
  value       = module.s3_bucket.bucket_arn
}

output "bucket_name" {
  description = "the name of the bucket"
  value       = module.s3_bucket.bucket_id
}
