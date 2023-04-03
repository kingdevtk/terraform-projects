output "access_logs_bucket_id" {
  description = "The S3 bucket ID for access logs"
  value       = module.nlb.access_logs_bucket_id
}

output "default_listener_arn" {
  description = "The arn of the default listener"
  value       = module.nlb.default_listener_arn
}

output "default_target_group_arn" {
  description = "The arn of the default target group"
  value       = module.nlb.default_target_group_arn
}

output "nlb_arn" {
  description = "The arn of the network load balancer"
  value       = module.nlb.nlb_arn
}

output "nlb_dns_name" {
  description = "The DNS name of the network load balancer"
  value       = module.nlb.nlb_dns_name
}

output "nlb_zone_id" {
  description = "The ID of the zone which the network load balancer is provisioned"
  value       = module.nlb.nlb_zone_id
}
