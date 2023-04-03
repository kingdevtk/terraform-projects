module "loupe_alb_with_cognito" {
  source  = "spacelift.io/loupetheapp/terraform-aws-alb/aws"
  version = "2.2.0"

  app_name    = "test-app"
  environment = "use1"
  is_internal = false
  loupe_tags  = { Team = "DevOps" }
  namespace   = "loupe"
  stage       = var.stage

  alb_ingress_cidr_blocks  = var.alb_ingress_cidr_blocks
  cognito_enabled          = true
  cognito_user_pool_config = var.cognito_user_pool_config
  ssl_certificate_arn      = var.ssl_certificate_arn
  target_group_port        = 3000
  vpc_id                   = var.vpc_id

  create_route53_alias   = true
  alb_route53_alias      = var.alb_route53_alias
  route53_parent_zone_id = var.route53_parent_zone_id
}
