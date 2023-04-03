  # Amazon ECS (Elastic Container Service) Service Terraform Module

This module is responsible for creating and configuring an ECS service in AWS.

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

**vpc_id**
- the vpc id that the service will get deployed in
- *type*: string

**ecs_service_name**
- the name of the ecs service
- *type*: string

**ecs_service_cluster_id**
- the ID for the cluster the ECS service should get attached to
- *type*: string

**ecs_service_task_count**
- the number of instances of the task definition to place and keep running
- *type*: number

**ecs_service_security_groups**
- a list of security group ids that will be associated with the ecs service/ task
- *type*: list(string)

**ecs_task_definition_name**
- the name of the task definition
- *type*: string

**ecs_task_unit_cpu**
- the number of cpu units used by the task
- *type*: number

**ecs_task_unit_memory**
- the amount of memory used by the task
- *type*: number

**ecs_task_execution_role_arn**
- the arn of the task execution role that the amazon ecs container agent and docker daemon can assume
- *type*: string

**ecs_task_role_arn**
- the arn of the role that allows your amazon ecs container to make calls to other aws resources
- *type*: string

**container_name**
- the name of the container
- *type*: string

**container_image**
- the image used to start a container
- *type*: string

**port_mappings**
- the list of port mappings for the container
- *type*: list(any)

**ecs_environment_variable_secret_name**
- the name of the secret in aws secrets manager that contains the environmet variables for the containers
- *type*: string

### Optional Variables
**add_load_balancer_configuration**
- True if the service will have a load balancer configured. False if the service will not have a laod balancer configured
- *type*: bool
- *default*: false

**ecs_service_target_group_arn**
- True the arn of the target group container will get registered to. Required if `add_load_balancer_configuration` is true
- *type*: string
- *default*: ""

**container_override_command**
- The command used to start the container. This command overrides the image command.
- *type*: list(string)
- *default*: []

**container_port**
- The port on the container to associate the load balancer. Required if `add_load_balancer_configuration` is true
- *type*: number
- *default*: 0

**autoscaling_enabled**
- A boolean to enable or disable autoscaling
- *type*: bool
- *default*: false

**ecs_autoscaling_policy_name**
- The name of the policy
- *type*: string

**target_value**
- Target value for the metric
- *type*: string

**predefined_metric_type**
- The metric type
- *type*: string

**resource_label**
- Use if the `predefined_metric_type` is `ALBRequestCountPerTarget`
- *type*: string

**scalable_dimension**
- Scalable dimension of the scalable target
- *type*: string

**service_namespace**
- AWS service namespace of the scalable target
- *type*: string

**max_capacity**
- Maximum capacity of the scalable target
- *type*: string

**min_capacity**
- Minimum capacity of the scalable target
- *type*: string

## Module Outputs
-------------------
**ecs_service_cluser_arn**
- the arn of the cluster which the service runs on

**ecs_service_id**
- the arn of the service

**ecs_service_name**
- the name of the service

**ecs_task_arn**
- the name of the task

**ecs_task_revision**
- revision of the task in a particular family

## Module Usage
---------------
```
module "kingdevtk_ecs_fargate_service" {
    source  = "spacelift.io/kingdevtk/terraform-aws-ecs-fargate-service/aws"
    version = "1.1.0"

    environment = "dev"
    region      = "us-east-1"
    vpc_id      = "vpc-0d5bd907e1fc1b504"

    ecs_service_name                = "kingdevtk-ecs-service"
    ecs_service_cluster_id          = "arn:aws:ecs:us-east-1:383156531227:cluster/kingdevtk-ecs-cluster"
    ecs_service_task_count          = 1
    ecs_service_security_groups     = ["sg-05025f31fec480a16"]
    add_load_balancer_configuration = false

    ecs_task_definition_name    = "kingdevtk-task-definition"
    ecs_task_unit_cpu           = 1024
    ecs_task_unit_memory        = 2048
    ecs_task_execution_role_arn = "arn:aws:iam::383156531227:role/ecsTaskExecutionRole"
    ecs_task_role_arn           = "arn:aws:iam::383156531227:role/ecsTaskRole"

    container_name  = "kingdevtk-container"
    container_image = "kingdevtk-api:latest"
    port_mappings   = [
        {
            "hostPort" : 3000,
            "protocol" : "tcp",
            "containerPort" : 3000
        }
    ]

    ecs_environment_variable_secret_name = "kingdevtk-environment-secrets-name"
}
```
