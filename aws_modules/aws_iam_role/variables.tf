variable "app_name" {
  description = "the name of the application the resource will be part of"
  type        = string
}

variable "kingdevtk_tags" {
  description = "a map of additional tags to assign to resources"
  type        = object({ Team = string })
}
variable "iam_role_description" {
  description = "the description of IAM role"
  type        = string
}

variable "aws_managed_policy_arns" {
  description = "the list of managed IAM policies to attach to the created IAM role"
  type        = set(string)
  default     = []
}

variable "iam_role_principals" {
  description = "the ARN of the AWS service that is allowed to assume the created IAM role"
  type        = map(list(string))
  default     = {}
}
