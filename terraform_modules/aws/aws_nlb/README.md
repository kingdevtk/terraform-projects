  # AWS NLB (Network Load Balancer) Terraform Module

This module is responsible for creating and configuring a network load balancer in AWS in compliance with company standards.

## What does this module do?
----------------------------
This module create the following resources in the targeted AWS account:
- AWS Network Load Balancer (NLB)
- AWS Load Balancer Target Group
- AWS Load Balancer Listener (option to enable TLS listener)
- Amazon S3 Bucket (used to store access logs)
- AWS Route 53 Alias Record for NLB (*optional*)
- Register Instances to Default Target Group (*optional*)

## Module Variables
-------------------
### Required Variables
**app_name**
- The name of the application the resource will be part of.
- *type*: string

**environment**
- The AWS region that the resources will get deployed in.
- *type*: string

**namespace**
- An abbreviation or name of the organization (should be set to kingdevtk).
- *type*: string

**stage**
- Used to indicate role, e.g. 'prod', 'staging', 'dev'.
- *type*: string

**vpc_id**
- The vpc id that the resource will get deployed in.
- *type*: string

**is_internal**
- True if the network load balancer is internal. False if the network load balancer is internet facing.
- *type*: bool

**kingdevtk_tags**
- A map of additional tags to assign to resources.
- *type*: object({
  Team = string
})

### Optional Variables
**create_route53_alias**
- A boolean flag to create a route53 alias record for the network load balancer.
- *type*: bool
- *default*: false

**health_check_path**
- The destination for the health check request.
- *type*: string
- *default*: "/"

**health_check_port**
- The port to send the health check request to (defaults to traffic-port).
- *type*: string
- *default*: null

**health_check_protocol**
- The protocol used for the health check request
- *type*: string
- *default*: null

**ssl_certificate_arn**
- The ARN of the default SSL certificate for HTTPS listener. Required when enabling TLS listener.
- *type*: string
- *default*: ""

**target_group_target_ids**
- A map of IDs/ IPs that will be registered in the default target group.
- *type*: map(string)
- *default*: {}

**target_group_port**
- The port for the default target group.
- *type*: number
- *default*: 80

**target_group_target_type**
- The type of targets that can be registered with the default target group.
- *type*: string
- *supported values*: ip, instance, lambda
- *default*: "instance"

**tcp_port**
- The port for the TCP listener.
- *type*: number
- *default*: 80

**tls_enabled**
- A boolean flag to enable/ disable TLS listener.
- *type*: bool
- *default*: false

**tls_port**
- The port for the TLS listener.
- *type*: number
- *default*: 443

**tls_ssl_policy**
- The name of the SSL policy for the listener.
- *type*: string
- *default*: "ELBSecurityPolicy-2016-08"

**nlb_route53_alias**
- The route 53 entry for the network load balancer. Required when create_route53_alias is true.
- *type*: string
- *default*: ""

**route53_parent_zone_id**
- ID of the hosted zone to contain this record. Required when create_route53_alias is true.
- *type*: string
- *default*: ""

## Module Outputs
-------------------
**access_logs_bucket_id**
- The S3 bucket ID for access logs

**default_listener_arn**
- The arn of the default listener

**default_target_group_arn**
- The arn of the default target group

**nlb_arn**
- The arn of the network load balancer

**nlb_dns_name**
- The DNS name of the network load balancer

**nlb_zone_id**
- The ID of the zone which the network load balancer is provisioned

## Module Usage
---------------
**Create Network Load Balancer Without Route53 Alias**
```
module "kingdevtk_nlb_without_route53_alias" {
  source  = "spacelift.io/kingdevtktheapp/terraform-aws-nlb/aws"
  version = "1.1.0"

  app_name    = "kingdevtk-app"
  environment = "use1"
  namespace   = "kingdevtk"
  stage       = "dev"

  is_internal = false
  vpc_id      = "vpc-0d5bd907e1fc1b504"

  kingdevtk_tags = {
    Team = "DevOps"
  }
}
```

**Create Network Load Balancer With Route53 Alias**
```
module "kingdevtk_nlb_with_route53_alias" {
  source  = "spacelift.io/kingdevtktheapp/terraform-aws-nlb/aws"
  version = "1.0.0"

  app_name    = "kingdevtk-app"
  environment = "use1"
  namespace   = "kingdevtk"
  stage       = "dev"

  create_route53_alias   = true
  is_internal            = false
  nlb_route53_alias      = "kingdevtk-app.dev.kingdevtktheapp.com"
  route53_parent_zone_id = "Z0605619360CWBQOF2DUO"
  vpc_id                 = "vpc-0d5bd907e1fc1b504"

  kingdevtk_tags = {
    Team = "DevOps"
  }
}
```

**Create Network Load Balancer With Route53 Alias and TLS Listener**
```
module "kingdevtk_nlb_with_route53_alias_and_tls_listener" {
  source  = "spacelift.io/kingdevtktheapp/terraform-aws-nlb/aws"
  version = "1.0.0"

  app_name    = "kingdevtk-app"
  environment = "use1"
  namespace   = "kingdevtk"
  stage       = "dev"

  create_route53_alias   = true
  is_internal            = false
  nlb_route53_alias      = "kingdevtk-app.dev.kingdevtktheapp.com"
  route53_parent_zone_id = "Z0605619360CWBQOF2DUO"
  ssl_certificate_arn    = "arn:aws:acm:us-east-1:383156531227:certificate/ba089a5b-ae18-4291-8d1b-d4d423de95d4"
  tls_enabled            = true
  tls_port               = 443
  tls_ssl_policy         = "ELBSecurityPolicy-2016-08"
  vpc_id                 = "vpc-0d5bd907e1fc1b504"

  target_group_target_ids = {
    app_ip = "10.0.1.0"
  }
  kingdevtk_tags = {
    Team = "DevOps"
  }
}
```
