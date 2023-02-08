module "nlb" {
  source  = "cloudposse/nlb/aws"
  version = "0.8.2"
  # https://registry.terraform.io/modules/cloudposse/nlb/aws/0.8.2

  vpc_id = var.vpc_id

  access_logs_enabled                     = true
  certificate_arn                         = var.ssl_certificate_arn
  cross_zone_load_balancing_enabled       = true
  deregistration_delay                    = 15
  enable_glacier_transition               = true
  enabled                                 = true
  expiration_days                         = 90
  glacier_transition_days                 = 60
  health_check_enabled                    = true
  health_check_interval                   = 10
  health_check_path                       = var.health_check_path
  health_check_port                       = var.health_check_port
  health_check_protocol                   = var.health_check_protocol
  health_check_threshold                  = 2
  internal                                = var.is_internal
  ip_address_type                         = "ipv4"
  lifecycle_rule_enabled                  = true
  name                                    = var.app_name
  nlb_access_logs_s3_bucket_force_destroy = true
  subnet_ids                              = var.is_internal == true ? data.aws_subnets.private.ids : data.aws_subnets.public.ids
  tags                                    = var.tags
  target_group_port                       = var.target_group_port
  target_group_target_type                = var.target_group_target_type
  tcp_enabled                             = true
  tcp_port                                = var.tcp_port
  tls_enabled                             = var.tls_enabled
  tls_port                                = var.tls_port
  tls_ssl_policy                          = var.tls_ssl_policy

  context = module.this.context
}

module "nlb_alias" {
  source  = "cloudposse/route53-alias/aws"
  version = "0.13.0"
  # https://registry.terraform.io/modules/cloudposse/route53-alias/aws/0.13.0

  count = var.create_route53_alias ? 1 : 0

  aliases         = [var.nlb_route53_alias]
  parent_zone_id  = var.route53_parent_zone_id
  target_dns_name = module.nlb.nlb_dns_name
  target_zone_id  = module.nlb.nlb_zone_id
  context         = module.this.context
}

resource "aws_lb_target_group_attachment" "nlb_target_group_attachment" {
  for_each         = var.target_group_target_ids
  target_group_arn = module.nlb.default_target_group_arn
  target_id        = each.value
}
