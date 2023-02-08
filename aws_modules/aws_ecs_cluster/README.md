  # Amazon ECS (Elastic Container Service) Cluster Terraform Module

This module is responsible for creating and configuring an ECS cluster in AWS.

## What does this module do?
----------------------------
This module create the following resources in the targeted AWS account:
- Amazon ECS Cluster
- CloudWatch log group (used in log configuration for cluster)
- AWS KMS Key (used to encrypt logs)

## Module Variables
-------------------
### Required Variables
**environment**
- the environment that the load balancer will get deployed in
- *type*: string

**region**
- the AWS region that the module will be deployed in
- *type*: string

**ecs_cluster_name**
- the name of the ecs cluster
- *type*: string

## Module Outputs
-------------------
**ecs_cluster_arn**
- the arn of the cluster created

**ecs_cluster_id**
- the arn of the cluster created

## Module Usage
---------------
```
module "ecs_cluster" {
  source = "../modules/aws/aws_ecs_cluster"

  environment      = "dev"
  region           = "us-east-1"
  ecs_cluster_name = "ecs-cluster"
}
```
