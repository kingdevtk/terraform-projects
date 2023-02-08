  # Amazon IAM (Identity Access Management) Role Terraform Module

This module is responsible for creating an IAM role in AWS in compliance with company standards.

## What does this module do?
----------------------------
This module creates the following resources in the targeted AWS account:
- Amazon IAM role

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

**iam_role_description**
- the description of the IAM role
- *type*: string

**aws_managed_policy_arns**
- the list of AWS managed policies to attach to the created IAM role
- *type*: any

**iam_role_principals**
- the list of ARNs to allow assuming the created IAM role
- *type*: map(list(string))


## Module Outputs
-------------------
**arn**
- the ARN of the IAM role created

**id**
- the ID of the IAM role created

**name**
- the name of the IAM role created

## Module Usage
---------------
```
module "kingdevtk_iam_role" {
    source  = "spacelift.io/kingdevtktheapp/terraform-aws-iam-role/aws"
    version = "2.0.0"

    namespace        = "kingdevtk"
    stage            = "dev"
    environment      = "use1"
    app_name         = "admin-tool"

    iam_role_description                   = "ECS Service Role for Admin Tool"
    aws_managed_policy_arns                = ["arn:aws:iam::aws:policy/aws-service-role/ECS"]
    iam_role_principals                    = {
  "AWS" = ["arn:aws:iam::1234567889101:role/aws-service-role/ecs.amazonaws.com/AWSServiceRoleForECS" ]
}

    kingdevtk_tags = {
      Team = "Backend"
    }
  }
```
