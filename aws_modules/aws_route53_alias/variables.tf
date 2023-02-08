variable "region" {
  description = "the AWS region that the module will be deployed in"
  type        = string
}

variable "route53_record_name" {
  description = "the name of the record that will get created"
  type        = string
}

variable "route53_zone_name" {
  description = "the name of the hosted zone that the record will be part of"
  type        = string
}

variable "route53_alias_target_dns_name" {
  description = "the dns domain name for the resource"
  type        = string

}

variable "route53_alias_target_zone_id" {
  description = "the hosted zone id for the resource"
  type        = string
}
