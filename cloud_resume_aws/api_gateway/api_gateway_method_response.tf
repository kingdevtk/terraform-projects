resource "aws_api_gateway_method_response" "tfer--g21z1pb3pa-002F-n8bg4d4t5k-002F-GET-002F-200" {
  http_method = "GET"
  resource_id = "n8bg4d4t5k"

  response_models = {
    "application/json" = "Empty"
  }

  response_parameters = {
    "method.response.header.Access-Control-Allow-Origin" = "false"
  }

  rest_api_id = "g21z1pb3pa"
  status_code = "200"
}

resource "aws_api_gateway_method_response" "tfer--g21z1pb3pa-002F-n8bg4d4t5k-002F-OPTIONS-002F-200" {
  http_method = "OPTIONS"
  resource_id = "n8bg4d4t5k"

  response_models = {
    "application/json" = "Empty"
  }

  response_parameters = {
    "method.response.header.Access-Control-Allow-Headers" = "false"
    "method.response.header.Access-Control-Allow-Methods" = "false"
    "method.response.header.Access-Control-Allow-Origin"  = "false"
  }

  rest_api_id = "g21z1pb3pa"
  status_code = "200"
}

resource "aws_api_gateway_method_response" "tfer--g21z1pb3pa-002F-n8bg4d4t5k-002F-POST-002F-200" {
  http_method = "POST"
  resource_id = "n8bg4d4t5k"

  response_models = {
    "application/json" = "Empty"
  }

  response_parameters = {
    "method.response.header.Access-Control-Allow-Origin" = "false"
  }

  rest_api_id = "g21z1pb3pa"
  status_code = "200"
}
