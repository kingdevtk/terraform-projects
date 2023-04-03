output "route53_record_name" {
  description = "the name of the route 53 record created"
  value       = aws_route53_record.route53_record.name
}
