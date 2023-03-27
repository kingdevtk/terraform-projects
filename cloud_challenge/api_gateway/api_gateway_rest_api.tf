resource "aws_api_gateway_rest_api" "tfer--g21z1pb3pa_visitors" {
  api_key_source               = "HEADER"
  disable_execute_api_endpoint = "false"

  endpoint_configuration {
    types = ["REGIONAL"]
  }

  minimum_compression_size = "-1"
  name                     = "visitors"
}
