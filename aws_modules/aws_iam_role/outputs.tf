output "arn" {
  description = "the ARN of the IAM role created"
  value       = module.iam-role.arn
}

output "id" {
  description = "the ID of the IAM role created"
  value       = module.iam-role.id
}

output "name" {
  description = "the name of the IAM role created"
  value       = module.iam-role.name
}
