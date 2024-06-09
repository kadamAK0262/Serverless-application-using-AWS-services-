
# DYNAMO_DB CREATION

resource "aws_dynamodb_table" "HTC_POC_OP_618580_DynamoDBTable" {
  name         = var.HTC_POC_OP_618580_DynamoDBTable_Name
  billing_mode = var.HTC_POC_OP_618580_DynamoDBTable_BillingMode
  hash_key     = var.HTC_POC_OP_618580_DynamoDBTable_HashKey
  attribute {
    name = var.HTC_POC_OP_618580_DynamoDBTable_HashKey
    type = var.HTC_POC_OP_618580_DynamoDBTable_AttributeType
  }
  tags = var.common_tags
}
