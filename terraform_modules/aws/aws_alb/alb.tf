module "alb" {
  source  = "cloudposse/alb/aws"
  version = "1.5.0"
  # https://registry.terraform.io/modules/cloudposse/alb/aws/latest

  name = var.app_name

  access_logs_enabled               = true
  certificate_arn                   = var.ssl_certificate_arn
  context                           = module.this.context
  cross_zone_load_balancing_enabled = true
  default_target_group_enabled      = false
  deletion_protection_enabled       = var.deletion_protection_enabled
  deregistration_delay              = var.deregistration_delay
  enabled                           = true
  health_check_healthy_threshold    = var.health_check_healthy_threshold
  health_check_interval             = var.health_check_interval
  health_check_matcher              = var.health_check_matcher
  health_check_path                 = var.health_check_path
  health_check_port                 = var.health_check_port
  health_check_timeout              = var.health_check_timeout
  health_check_unhealthy_threshold  = var.health_check_unhealthy_threshold
  http2_enabled                     = true
  http_enabled                      = false
  http_port                         = var.http_port
  http_redirect                     = false
  https_enabled                     = false
  https_port                        = var.https_port
  internal                          = var.is_internal
  ip_address_type                   = "ipv4"
  security_group_enabled            = true
  subnet_ids                        = var.is_internal ? data.aws_subnets.private.ids : data.aws_subnets.public.ids
  tags                              = var.loupe_tags
  target_group_port                 = var.target_group_port
  target_group_protocol             = var.target_group_protocol
  target_group_target_type          = var.target_group_target_type
  vpc_id                            = var.vpc_id
}

module "alb_alias" {
  source  = "cloudposse/route53-alias/aws"
  version = "0.13.0"
  # https://registry.terraform.io/modules/cloudposse/route53-alias/aws/0.13.0

  count = var.create_route53_alias ? 1 : 0

  aliases         = [var.alb_route53_alias]
  parent_zone_id  = var.route53_parent_zone_id
  target_dns_name = module.alb.alb_dns_name
  target_zone_id  = module.alb.alb_zone_id
  context         = module.this.context
}
