variable "app_name" {
  description = "the name of the application the resource will be part of"
  type        = string
}

variable "loupe_tags" {
  description = "a map of additional tags to assign to resources"
  type        = object({ Team = string })
}
variable "iam_policy_description" {
  description = "the description of IAM policy"
  type        = string
  default     = null
}

variable "iam_policy_statements" {
  description = "the map of IAM policy statements to use in the policy"
  type        = any
  default     = {}
}
