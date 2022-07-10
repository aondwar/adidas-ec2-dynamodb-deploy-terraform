
##Dynamo DB
resource "aws_dynamodb_table" "adidas_assignment" {
  name           = var.table_name
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "Id"
  range_key      = "Timestamp"

  attribute {
    name = "Id"
    type = "S"
  }

  attribute {
    name = "name"
    type = "S"
  }

  attribute {
    name = "age"
    type = "N"
  }
  attribute {
    name = "Timestamp"
    type = "S"
  }


  global_secondary_index {
    name               = "User"
    hash_key           = "name"
    range_key          = "age"
    write_capacity     = 10
    read_capacity      = 10
    projection_type    = "INCLUDE"
    non_key_attributes = ["Id"]
  }

}