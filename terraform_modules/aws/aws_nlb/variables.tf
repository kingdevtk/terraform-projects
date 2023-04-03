## Required
variable "app_name" {
  description = "The name of the application the resource will be part of."
  type        = string
}

variable "vpc_id" {
  description = "The vpc id that the resource will get deployed in."
  type        = string
}

variable "is_internal" {
  description = "True if the network load balancer is internal. False if the network load balancer is internet facing."
  type        = bool
}

variable "kingdevtk_tags" {
  description = "A map of additional tags to assign to resources."
  type = object({
    Team = string
  })
}

## Optional
variable "create_route53_alias" {
  description = "A boolean flag to create a route53 alias record for the network load balancer."
  type        = bool
  default     = false
}

variable "health_check_path" {
  description = "The destination for the health check request."
  type        = string
  default     = "/"
}

variable "health_check_port" {
  description = "The port to send the health check request to (defaults to traffic-port)."
  type        = string
  default     = null
}

variable "health_check_protocol" {
  description = "The protocol used for the health check request."
  type        = string
  default     = null
}

variable "ssl_certificate_arn" {
  description = "The ARN of the default SSL certificate for HTTPS listener. Required when enabling TLS listener."
  type        = string
  default     = ""
}

variable "target_group_target_ids" {
  description = "A map of IDs/ IPs that will be registered in the default target group."
  type        = map(string)
  default     = {}
}

variable "target_group_port" {
  description = "The port for the default target group."
  type        = number
  default     = 80
}

variable "target_group_target_type" {
  description = "The type of targets that can be registered with the default target group."
  type        = string
  default     = "instance"

  validation {
    condition     = contains(["ip", "instance", "lambda"], var.target_group_target_type)
    error_message = "Valid values for target_group_target_type: ip, instance, lambda."
  }
}

variable "tcp_port" {
  description = "The port for the TCP listener."
  type        = number
  default     = 80
}

variable "tls_enabled" {
  description = "A boolean flag to enable/ disable TLS listener."
  type        = bool
  default     = false
}

variable "tls_port" {
  description = "The port for the TLS listener."
  type        = number
  default     = 443
}

variable "tls_ssl_policy" {
  description = "The name of the SSL policy for the listener."
  type        = string
  default     = "ELBSecurityPolicy-2016-08"
}

variable "nlb_route53_alias" {
  description = "The route 53 entry for the network load balancer. Required when create_route53_alias is true."
  type        = string
  default     = ""
}

variable "route53_parent_zone_id" {
  description = "ID of the hosted zone to contain this record. Required when create_route53_alias is true."
  type        = string
  default     = ""
}
