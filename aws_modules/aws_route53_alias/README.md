# Amazon Route 53 Alias Terraform Module

This module is responsible for creating and configuring a route 53 alias record.

## What does this module do?
----------------------------
This module create the following resources in the targeted AWS account:
- Amazon Route 53 Alias Record

## Module Variables
-------------------
### Required Variables
**region**
- the AWS region that the module will be deployed in
- *type*: string

**route53_record_name**
- the name of the record that will get created
- *type*: string

**route53_zone_name**
- the name of the hosted zone that the record will be part of
- *type*: string

**route53_alias_target_dns_name**
- the dns domain name for the resource
- *type*: string

**route53_alias_target_zone_id**
- the hosted zone id for the resource
- *type*: string

## Module Outputs
-------------------
**route53_record_name**
- the name of the route 53 record created"

## Module Usage
---------------
```
module "kingdevtk_alb_route53_record" {
  source  = "spacelift.io/kingdevtktheapp/terraform-aws-route53-alias/aws"
  version = "1.0.0"

  region = "us-east-1"

  route53_record_name = "kingdevtk.dev-backend.kingdevtktheapp.com"
  route53_zone_name   = "dev-backend.kingdevtktheapp.com"

  route53_alias_target_dns_name = "kingdevtk-1630911274.us-east-1.elb.amazonaws.com"
  route53_alias_target_zone_id  = "Z35SXDOTRQ7X7K"
}

```
