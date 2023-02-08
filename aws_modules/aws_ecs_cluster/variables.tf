variable "environment" {
  description = "the environment that the load balancer will get deployed in"
  type        = string
}

variable "region" {
  description = "the AWS region that the module will be deployed in"
  type        = string
}

variable "ecs_cluster_name" {
  description = "the name of the ecs cluster"
  type        = string
}
