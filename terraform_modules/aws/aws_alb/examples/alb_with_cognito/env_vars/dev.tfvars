stage                   = "dev"
alb_ingress_cidr_blocks = ["8.9.5.95/32"]
cognito_user_pool_config = {
  user_pool_arn       = "arn:aws:cognito-idp:us-east-1:383156531227:userpool/us-east-1_BpH4XtwtM"
  user_pool_client_id = "fja473jma0mp6tmkf93tb9p41"
  user_pool_domain    = "dev-admin-tool.auth.us-east-1.amazoncognito.com"
}
ssl_certificate_arn    = "arn:aws:acm:us-east-1:383156531227:certificate/ba089a5b-ae18-4291-8d1b-d4d423de95d4"
vpc_id                 = "vpc-0d5bd907e1fc1b504"
route53_parent_zone_id = "Z0605619360CWBQOF2DUO"
alb_route53_alias      = "test.dev-backend.loupetheapp.com"
