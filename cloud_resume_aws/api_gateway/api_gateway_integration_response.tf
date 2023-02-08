resource "aws_api_gateway_integration_response" "tfer--g21z1pb3pa-002F-n8bg4d4t5k-002F-GET-002F-200" {
  http_method = "GET"
  resource_id = "n8bg4d4t5k"

  response_parameters = {
    "method.response.header.Access-Control-Allow-Origin" = "'*'"
  }

  rest_api_id = "g21z1pb3pa"
  status_code = "200"
}

resource "aws_api_gateway_integration_response" "tfer--g21z1pb3pa-002F-n8bg4d4t5k-002F-OPTIONS-002F-200" {
  http_method = "OPTIONS"
  resource_id = "n8bg4d4t5k"

  response_parameters = {
    "method.response.header.Access-Control-Allow-Headers" = "'Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token'"
    "method.response.header.Access-Control-Allow-Methods" = "'GET,OPTIONS,POST'"
    "method.response.header.Access-Control-Allow-Origin"  = "'*'"
  }

  rest_api_id = "g21z1pb3pa"
  status_code = "200"
}

resource "aws_api_gateway_integration_response" "tfer--g21z1pb3pa-002F-n8bg4d4t5k-002F-POST-002F-200" {
  http_method = "POST"
  resource_id = "n8bg4d4t5k"

  response_parameters = {
    "method.response.header.Access-Control-Allow-Origin" = "'*'"
  }

  rest_api_id = "g21z1pb3pa"
  status_code = "200"
}
