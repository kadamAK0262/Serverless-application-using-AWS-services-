
# DYNAMO_DB CREATION

resource "aws_dynamodb_table" "Usecase_DynamoDBTable" {
  name         = var.Usecase_DynamoDBTable_Name
  billing_mode = var.Usecase_DynamoDBTable_BillingMode
  hash_key     = var.Usecase_DynamoDBTable_HashKey
  attribute {
    name = var.Usecase_DynamoDBTable_HashKey
    type = var.Usecase_DynamoDBTable_AttributeType
  }
  tags = var.common_tags
}
