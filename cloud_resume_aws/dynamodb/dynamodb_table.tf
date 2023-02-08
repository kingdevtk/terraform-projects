resource "aws_dynamodb_table" "tfer--Visitors" {
  attribute {
    name = "visitor_id"
    type = "S"
  }

  billing_mode = "PROVISIONED"
  hash_key     = "visitor_id"
  name         = "Visitors"

  point_in_time_recovery {
    enabled = "false"
  }

  read_capacity  = "1"
  stream_enabled = "false"
  write_capacity = "1"
}
