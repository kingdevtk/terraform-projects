variable "app_name" {
  description = "the name of the application the resource will be part of"
  type        = string
}

variable "loupe_tags" {
  description = "a map of additional tags to assign to resources"
  type        = object({ Team = string })
}

variable "image_tag_mutability" {
  description = "configures image mutability for the ECR repository"
  type        = string
  default     = "IMMUTABLE"
}
