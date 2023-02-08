  # Amazon IAM (Identity Access Management) Policy Terraform Module

This module is responsible for creating an IAM policy in AWS in compliance with company standards.

## What does this module do?
----------------------------
This module creates the following resources in the targeted AWS account:
- Amazon IAM policy

## Module Variables
-------------------
### Required Variables
**namespace**
- name or abbreviation of the organization (should be set to "kingdevtk")

**stage**
- the environment that the IAM role will be deployed in
- *type*: string

**environment**
- the AWS region that the module will be deployed in
- *type*: string

**app_name**
- the name of the application the resource will be part of
- *type*: string

**kingdevtk_tags**
- a map of additional tags to assign to resources
- type: object({ Team = string })

**iam_policy_description**
- the description of the IAM policy
- *type*: string

**iam_policy_statements**
- the map of IAM policy statements to use in the policy
- *type*: any

## Module Outputs
-------------------
**policy_arn**
- the ARN of the created IAM policy

## Module Usage
---------------
```
module "kingdevtk_iam_policy" {
    source  = "spacelift.io/kingdevtktheapp/terraform-aws-iam-policy/aws"
    version = "2.0.0"

    namespace        = "kingdevtk"
    stage            = "dev"
    environment      = "use1"
    app_name         = "admin-tool"

    iam_policy_description        = "IAM policy for s3"
    iam_policy_statements         = {
    ListMyBucket = {
      effect     = "Allow"
      actions    = ["s3:ListBucket"]
      resources  = ["arn:aws:s3:::test"]
      conditions = []
    }
    WriteMyBucket = {
      effect     = "Allow"
      actions    = ["s3:PutObject", "s3:GetObject", "s3:DeleteObject"]
      resources  = ["arn:aws:s3:::test/*"]
      conditions = []
    }

    kingdevtk_tags = {
      Team = "Backend"
    }
  }
```
