# Required Variables
variable "app_name" {
  description = "the name of the application the resource will be part of"
  type        = string
}

variable "loupe_tags" {
  description = "a map of additional tags to assign to resources"
  type = object({
    Team = string
  })
}

variable "vpc_id" {
  description = "the vpc id that the service will get deployed in"
  type        = string
}

variable "is_internal" {
  description = "true if the application load balancer is internal. False if the application load balancer is internet facing"
  type        = bool
}

variable "ssl_certificate_arn" {
  description = "the arn of the ssl certificate to attach to the application load balancer"
  type        = string
}

variable "target_group_port" {
  description = "the port on which the targets receive traffic"
  type        = number
}

# Optional Variables
variable "alb_route53_alias" {
  description = "the route 53 entry for the application load balancer. Required when create_route53_alias is true."
  type        = string
  default     = ""
}

variable "cognito_enabled" {
  description = "a boolean to enable or disable cognito authentication for application load balancer"
  type        = bool
  default     = false
}

variable "cognito_user_pool_config" {
  description = "the AWS cognito user pool configuration that will be used to configure authentication on the application load balancer"
  type = object({
    user_pool_arn       = string
    user_pool_client_id = string
    user_pool_domain    = string
  })
  default = null
}

variable "create_route53_alias" {
  description = "a boolean flag to create a route53 alias record for the application load balancer."
  type        = bool
  default     = false
}

variable "deletion_protection_enabled" {
  description = "a boolean to enable or disable delete protection"
  type        = bool
  default     = false
}

variable "deregistration_delay" {
  description = "the amount of time (in seconds) to wait before changing the state of a deregistering target to unused"
  type        = number
  default     = 15
}

variable "health_check_healthy_threshold" {
  description = "the number of consecutive health checks successes required before considering a target healthy"
  type        = number
  default     = 2
}

variable "health_check_interval" {
  description = "the duration (in seconds) between health checks"
  type        = number
  default     = 15
}

variable "health_check_matcher" {
  description = "the HTTP response codes to indicate a healthy check"
  type        = string
  default     = "200-399"
}

variable "health_check_path" {
  description = "the destination for the health check request"
  type        = string
  default     = "/"
}

variable "health_check_port" {
  description = "the port to use for the health check"
  type        = string
  default     = "traffic-port"
}

variable "health_check_timeout" {
  description = "the amount of time (in seconds) to wait before failing a health check request"
  type        = number
  default     = 10
}

variable "health_check_unhealthy_threshold" {
  description = "the number of consecutive health checks failures required before considering a target unhealthy"
  type        = number
  default     = 2
}

variable "alb_ingress_cidr_blocks" {
  description = "list of CIDR blocks to allow in security group"
  type        = list(string)
  default     = []
}

variable "http_port" {
  description = "the port for the HTTP listener"
  type        = number
  default     = 80
}

variable "https_port" {
  description = "the port for the HTTPS listener"
  type        = number
  default     = 443
}

variable "load_balancing_algorithm_type" {
  description = "the algorithm used to determine how traffic will be routed to targets"
  type        = string
  default     = "round_robin"
}

variable "route53_parent_zone_id" {
  description = "ID of the hosted zone to contain this record. Required when create_route53_alias is true."
  type        = string
  default     = ""
}

variable "target_group_protocol" {
  description = "the protocol for the default target group. Expected values are HTTP or HTTPS"
  type        = string
  default     = "HTTP"
  validation {
    condition     = contains(["HTTP", "HTTPS"], var.target_group_protocol)
    error_message = "Valid values for target_group_protocol: HTTP, HTTPS."
  }
}

variable "target_group_target_type" {
  description = "the type of targets that will be managed by the target group. Expected values are ip, instance, or lambda"
  type        = string
  default     = "ip"
  validation {
    condition     = contains(["ip", "instance", "lambda"], var.target_group_target_type)
    error_message = "Valid values for target_group_target_type: ip, instance, lambda."
  }
}
