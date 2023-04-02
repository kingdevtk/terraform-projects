variable "region" {
  description = "the AWS region that the module will be deployed in"
  type        = string
}

variable "bucket_name" {
  description = "the name of the bucket"
  type        = string
}

variable "tags" {
  description = "a map of tags that will get applied to the bucket"
  type        = map(string)
  default     = {}
}
