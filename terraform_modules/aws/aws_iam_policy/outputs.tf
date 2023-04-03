output "policy_arn" {
  description = "the ARN of the IAM policy"
  value       = module.iam-policy.policy_arn
}