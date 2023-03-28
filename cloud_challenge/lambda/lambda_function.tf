resource "aws_lambda_function" "tfer--Visitors" {
  architectures = ["x86_64"]

  ephemeral_storage {
    size = "512"
  }

  filename                       = null
  function_name                  = "Visitors"
  handler                        = "lambda_function.handler"
  image_uri                      = ""
  memory_size                    = "128"
  package_type                   = "Zip"
  reserved_concurrent_executions = "-1"
  role                           = "arn:aws:iam::438207642063:role/lambda"
  runtime                        = "python3.9"
  s3_bucket                      = null
  skip_destroy                   = "false"
  source_code_hash               = "rLzZNRGSF1hIvSoUPpumS7xEGr75b25BMcreTBOn1i0="
  timeout                        = "3"

  tracing_config {
    mode = "PassThrough"
  }
}
