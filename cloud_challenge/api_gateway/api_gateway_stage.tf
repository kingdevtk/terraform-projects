resource "aws_api_gateway_stage" "tfer--g21z1pb3pa-002F-prod" {
  cache_cluster_enabled = "false"
  cache_cluster_size    = "0.5"
  deployment_id         = "iep57f"
  rest_api_id           = "g21z1pb3pa"
  stage_name            = "prod"
  xray_tracing_enabled  = "false"
}
