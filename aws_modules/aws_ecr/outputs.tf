output "repository_arn" {
  description = "ARN of the repository created"
  value       = module.ecr.repository_arn
}

output "registry_id" {
  description = "the ID of the registry"
  value       = module.ecr.registry_id
}

output "repository_url" {
  description = "the URL of the repository created"
  value       = module.ecr.repository_url
}
