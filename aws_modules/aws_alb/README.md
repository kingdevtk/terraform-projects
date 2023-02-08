  # AWS ALB (Application Load Balancer) Terraform Module

This module is responsible for creating and configuring an application load balancer in AWS.

## What does this module do?
----------------------------
This module creates the following resources in the targeted AWS account:
- AWS Application Load Balancer
- AWS Load Balancer Default Target Group
- AWS Load Balancer Listener
    - Forward action on HTTPS port (default port is 443)
    - Forward action on HTTPS port with Amazon Cognito authentication (*optional*)
    - Redirect action on HTTP port (default port is 80)
- Amazon S3 Bucket (used to store access logs)
- AWS Route 53 Alias Record for ALB (*optional*)

## Module Variables
-------------------
### Required Variables
**app_name**
- the name of the application that the resource is part of (e.g. 'retool')
- *type*: string

**environment**
- the AWS region that the resource will get deployed in
- *type*: string

**is_internal**
- True if the application load balancer is internal. False if the application load balancer is internet facing
- *type*: bool

**loupe_tags**
- a map of additional tags to assign to resources
- *type*: object({ Team = string })

**namespace**
- an abbreviation of your organization name
- *type*: string

**ssl_certificate_arn**
- the arn of the ssl certificate to attach to the application load balancer
- *type*: string

**stage**
- the environment that the region will be deployed in
- *type*: string

**target_group_port**
- the port on which the targets receive traffic
- *type*: number

**vpc_id**
- the vpc id that the service will get deployed in
- *type*: string

### Optional Variables
**alb_route53_alias**
- the route 53 entry for the application load balancer. Required when create_route53_alias is true
- *type*: string
- *default*: ""

**cognito_enabled**
- a boolean to enable or disable cognito authentication for application load balance
- *type*: bool
- *default*: false

**cognito_user_pool_config**
- the AWS cognito user pool configuration that will be used to configure authentication on the application load balancer
- *type*: object({
    user_pool_arn       = string
    user_pool_client_id = string
    user_pool_domain    = string
  })
- *default*: null

**create_route53_alias**
- a boolean flag to create a route53 alias record for the application load balancer
- *type*: bool
- *default*: false

**deletion_protection_enabled**
- a boolean to enable or disable delete protection
- *type*: bool
- *default*: false

**deregistration_delay**
- the amount of time (in seconds) to wait before changing the state of a deregistering target to unused
- *type*: number
- *default*: 15

**health_check_healthy_threshold**
- the number of consecutive health checks successes required before considering a target healthy
- *type*: number
- *default*: 2

**health_check_interval**
- the duration (in seconds) between health checks
- *type*: number
- *default*: 15

**health_check_matcher**
- the HTTP response codes to indicate a healthy check
- *type*: string
- *default*: "200-399"

**health_check_path**
- the destination for the health check request
- *type*: string
- *default*: "/"

**health_check_port**
- the port to use for the health check
- *type*: string
- *default*: "traffic-port"

**health_check_timeout**
- the amount of time (in seconds) to wait before failing a health check request
- *type*: number
- *default*: 10

**health_check_unhealthy_threshold**
- the number of consecutive health checks failures required before considering a target unhealthy
- *type*: number
- *default*: 2

**alb_ingress_cidr_blocks**
- list of CIDR blocks to allow in security group
- *type*: list(string)
- *default*: []

**http_port**
- the port for the HTTP listener
- *type*: number
- *default*: 80

**https_port**
- the port for the HTTPS listener
- *type*: number
- *default*: 443

**load_balancing_algorithm_type**
- the algorithm used to determine how traffic will be routed to targets
- *type*: string
- *default*: "round_robin"

**route53_parent_zone_id**
- ID of the hosted zone to contain this record. Required when create_route53_alias is true
- *type*: string
- *default*: ""

**target_group_protocol**
- the protocol to use when routing traffic to the targets
- *type*: string
- *supported values*: HTTP, HTTPS
- *default*: "HTTP"

**target_group_target_type**
- the type of targets that will be managed by the target group. IP and instance only supported at this time
- *type*: string
- *supported values*: ip, instance, lambda
- *default*: "ip"

## Module Outputs
-------------------
**target_group_arn**
- the arn of the target group

**target_group_name**
- the name of the target group

**application_load_balancer_arn**
- the arn of the application load balancer

**application_load_balancer_dns**
- the dns name of the application load balancer

**application_load_balancer_zone_id**
- the zone id of the application load balancer

**application_load_balancer_security_group_id**
- the id of the security group attached to the application load balancer

## Module Usage
---------------
**Create Application Load Balancer**
```
module "alb" {
  source  = "spacelift.io/kingdevtk/terraform-aws-alb/aws"
  version = "2.0.0"

  app_name    = "test-app"
  environment = "use1"
  is_internal = false
  loupe_tags  = { Team = "DevOps" }
  namespace   = "kingdevtk"
  stage       = "dev"

  alb_ingress_cidr_blocks = ["8.9.5.95/32"]
  ssl_certificate_arn     = "arn:aws:acm:us-east-1:383156531227:certificate/ba123a5b-ae18-4291-8d1b-d4d423de95d4"
  target_group_port       = 3000
  vpc_id                  = "vpc-1234ac907e1fc1b504"
}
```

**Create Application Load Balancer With Cognito and Route53 Alias**
```
module "alb_with_cognito" {
  source  = "spacelift.io/kingdevtk/terraform-aws-alb/aws"
  version = "2.2.0"

  app_name    = "test-app"
  environment = "use1"
  is_internal = false
  loupe_tags  = { Team = "DevOps" }
  namespace   = "loupe"
  stage       = "dev"

  alb_ingress_cidr_blocks  = ["8.9.5.95/32"]
  cognito_enabled          = true
  cognito_user_pool_config = {
    user_pool_arn       = "arn:aws:cognito-idp:us-east-1:383156531227:userpool/us-east-1_BpH4XtwtM"
    user_pool_client_id = "fja473jma0mp6tmkf93tb9p41"
    user_pool_domain    = "dev-admin-tool.auth.us-east-1.amazoncognito.com"
  }
  ssl_certificate_arn      = "arn:aws:acm:us-east-1:383156531227:certificate/ba089a5b-ae18-4291-8d1b-d4d423de95d4"
  target_group_port        = 3000
  vpc_id                   = "vpc-0d5bd907e1fc1b504"

  create_route53_alias   = true
  alb_route53_alias      = "test.dev-backend.kingdevtk.com"
  route53_parent_zone_id = "Z0605619360CWBQOF2DUO"
}
```
