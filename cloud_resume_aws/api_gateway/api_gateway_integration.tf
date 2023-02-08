resource "aws_api_gateway_integration" "tfer--g21z1pb3pa-002F-n8bg4d4t5k-002F-GET" {
  cache_namespace         = "n8bg4d4t5k"
  connection_type         = "INTERNET"
  content_handling        = "CONVERT_TO_TEXT"
  http_method             = "GET"
  integration_http_method = "POST"
  passthrough_behavior    = "WHEN_NO_TEMPLATES"

  request_templates = {
    "application/json" = "{\n    \"http_method\": \"$context.httpMethod\"\n}"
  }

  resource_id          = "n8bg4d4t5k"
  rest_api_id          = "g21z1pb3pa"
  timeout_milliseconds = "29000"
  type                 = "AWS"
  uri                  = "arn:aws:apigateway:us-east-1:lambda:path/2015-03-31/functions/arn:aws:lambda:us-east-1:438207642063:function:Visitors/invocations"
}

resource "aws_api_gateway_integration" "tfer--g21z1pb3pa-002F-n8bg4d4t5k-002F-OPTIONS" {
  cache_namespace      = "n8bg4d4t5k"
  connection_type      = "INTERNET"
  http_method          = "OPTIONS"
  passthrough_behavior = "WHEN_NO_MATCH"

  request_templates = {
    "application/json" = "{\"statusCode\": 200}"
  }

  resource_id          = "n8bg4d4t5k"
  rest_api_id          = "g21z1pb3pa"
  timeout_milliseconds = "29000"
  type                 = "MOCK"
}

resource "aws_api_gateway_integration" "tfer--g21z1pb3pa-002F-n8bg4d4t5k-002F-POST" {
  cache_namespace         = "n8bg4d4t5k"
  connection_type         = "INTERNET"
  content_handling        = "CONVERT_TO_TEXT"
  http_method             = "POST"
  integration_http_method = "POST"
  passthrough_behavior    = "WHEN_NO_TEMPLATES"

  request_templates = {
    "application/json" = "{\n    \"http_method\": \"$context.httpMethod\"\n}"
  }

  resource_id          = "n8bg4d4t5k"
  rest_api_id          = "g21z1pb3pa"
  timeout_milliseconds = "29000"
  type                 = "AWS"
  uri                  = "arn:aws:apigateway:us-east-1:lambda:path/2015-03-31/functions/arn:aws:lambda:us-east-1:438207642063:function:Visitors/invocations"
}
