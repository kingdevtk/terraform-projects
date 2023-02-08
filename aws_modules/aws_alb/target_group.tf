resource "aws_lb_target_group" "default" {
  name                          = join("-", [module.this.id, var.app_name])
  load_balancing_algorithm_type = var.load_balancing_algorithm_type
  port                          = var.target_group_port
  protocol                      = var.target_group_protocol
  target_type                   = var.target_group_target_type
  vpc_id                        = var.vpc_id

  health_check {
    enabled             = true
    healthy_threshold   = var.health_check_healthy_threshold
    interval            = var.health_check_interval
    matcher             = var.health_check_matcher
    path                = var.health_check_path
    unhealthy_threshold = var.health_check_unhealthy_threshold
  }

  tags = merge(module.this.tags, var.loupe_tags)
}
