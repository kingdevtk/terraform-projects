resource "aws_lb_listener" "https_forward" {
  count             = var.cognito_enabled ? 0 : 1
  certificate_arn   = var.ssl_certificate_arn
  load_balancer_arn = module.alb.alb_arn
  port              = var.https_port
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2015-05"
  tags              = merge(module.this.tags, var.loupe_tags)

  default_action {
    target_group_arn = aws_lb_target_group.default.arn
    type             = "forward"
  }
}

resource "aws_lb_listener" "https_forward_with_cognito" {
  count             = var.cognito_enabled ? 1 : 0
  certificate_arn   = var.ssl_certificate_arn
  load_balancer_arn = module.alb.alb_arn
  port              = var.https_port
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2015-05"
  tags              = merge(module.this.tags, var.loupe_tags)

  default_action {
    type = "authenticate-cognito"

    authenticate_cognito {
      user_pool_arn       = var.cognito_user_pool_config.user_pool_arn
      user_pool_client_id = var.cognito_user_pool_config.user_pool_client_id
      user_pool_domain    = var.cognito_user_pool_config.user_pool_domain
    }
  }

  default_action {
    target_group_arn = aws_lb_target_group.default.arn
    type             = "forward"
  }
}

resource "aws_lb_listener" "http_redirect" {
  load_balancer_arn = module.alb.alb_arn
  port              = var.http_port
  protocol          = "HTTP"
  tags              = merge(module.this.tags, var.loupe_tags)

  default_action {
    target_group_arn = aws_lb_target_group.default.arn
    type             = "redirect"

    redirect {
      port        = var.https_port
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

