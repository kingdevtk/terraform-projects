module "alb" {
  source  = "spacelift.io/kingdevtk/terraform-aws-alb/aws"
  version = "2.2.0"

  app_name    = "test-app"
  environment = "use1"
  is_internal = false
  loupe_tags  = { Team = "DevOps" }
  namespace   = "kingdevtk"
  stage       = var.stage

  alb_ingress_cidr_blocks = var.alb_ingress_cidr_blocks
  ssl_certificate_arn     = var.ssl_certificate_arn
  target_group_port       = 3000
  vpc_id                  = var.vpc_id
}
