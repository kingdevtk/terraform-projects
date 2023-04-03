resource "aws_route53_record" "route53_record" {
  name    = var.route53_record_name
  type    = "A"
  zone_id = data.aws_route53_zone.route53_zone.zone_id

  alias {
    evaluate_target_health = true
    name                   = var.route53_alias_target_dns_name
    zone_id                = var.route53_alias_target_zone_id
  }
}
