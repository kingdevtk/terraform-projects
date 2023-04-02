locals {
  service_name = (var.autoscaling_enabled ?
    (try(aws_ecs_service.ecs_fargate_service_with_autoscaling_with_load_balancer[0].name, aws_ecs_service.ecs_fargate_service_with_autoscaling_without_load_balancer[0].name)) :
  null)
}

resource "aws_appautoscaling_policy" "ecs_policy" {
  count = var.autoscaling_enabled ? 1 : 0

  name               = var.ecs_autoscaling_policy_name
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.ecs_target[0].resource_id
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"
  target_tracking_scaling_policy_configuration {
    target_value = var.target_value
    predefined_metric_specification {
      predefined_metric_type = var.predefined_metric_type
      resource_label         = var.predefined_metric_type == "ALBRequestCountPerTarget" ? "${data.aws_lb.alb_arn[0].arn_suffix}/${data.aws_lb_target_group.target_group_arn[0].arn_suffix}" : null
    }
  }
}

resource "aws_appautoscaling_target" "ecs_target" {
  count = var.autoscaling_enabled ? 1 : 0

  max_capacity       = var.max_capacity
  min_capacity       = var.min_capacity
  resource_id        = "service/${var.ecs_service_cluster_name}/${local.service_name}"
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"
}
