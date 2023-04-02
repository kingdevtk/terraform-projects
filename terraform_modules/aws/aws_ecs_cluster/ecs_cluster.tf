resource "aws_kms_key" "ecs_cluster_kms_key" {
  deletion_window_in_days = 7
}

resource "aws_cloudwatch_log_group" "ecs_cluster_log_group" {
  name = "${var.ecs_cluster_name}-logs"
  tags = {
    ecs_cluster_name = var.ecs_cluster_name
    environment      = var.environment
  }
}

resource "aws_ecs_cluster" "ecs_cluster" {
  name = var.ecs_cluster_name

  configuration {
    execute_command_configuration {
      kms_key_id = aws_kms_key.ecs_cluster_kms_key.arn
      logging    = "OVERRIDE"

      log_configuration {
        cloud_watch_encryption_enabled = true
        cloud_watch_log_group_name     = aws_cloudwatch_log_group.ecs_cluster_log_group.name
      }
    }
  }

  tags = {
    ecs_cluster_name = var.ecs_cluster_name
    environment      = var.environment
  }

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}
