
# ARCHIVE LAMBDA FUNCTION FILES


data "archive_file" "HTC_POC_OP_618580_LambdaFunction_CRUD_Archive" {
  type        = "zip"
  source_file = var.HTC_POC_OP_618580_LambdaFunction_CRUD_FileName
  output_path = "${path.module}${var.HTC_POC_OP_618580_LambdaFunction_CRUD_Archive}.zip"
}

data "archive_file" "HTC_POC_OP_618580_LambdaFunction_GET_Archive" {
  type        = "zip"
  source_file = var.HTC_POC_OP_618580_LambdaFunction_GET_FileName
  output_path = "${path.module}${var.HTC_POC_OP_618580_LambdaFunction_GET_Archive}.zip"
}

data "archive_file" "HTC_POC_OP_618580_LambdaTokenAuthorizer_Archive" {
  type        = "zip"
  source_file = var.HTC_POC_OP_618580_LambdaTokenAuthorizer_FileName
  output_path = "${path.module}${var.HTC_POC_OP_618580_LambdaTokenAuthorizer_Archive}.zip"
}

# LAMBDA_FUNCTION_CRUD CREATION


resource "aws_lambda_function" "HTC_POC_OP_618580_LambdaFunction_CRUD" {
  filename      = var.HTC_POC_OP_618580_LambdaFunction_CRUD_FileName_archives
  function_name = var.HTC_POC_OP_618580_LambdaFunction_CRUD_FunctionName
  role          = var.HTC_POC_OP_618580_LambdaRole_ARN
  handler       = var.HTC_POC_OP_618580_LambdaFunction_CRUD_Handler
  runtime       = var.HTC_POC_OP_618580_LambdaFunction_Runtime

  environment {
    variables = {
      DYNAMODB_TABLE_NAME = var.HTC_POC_OP_618580_DynamoDBTable_Name,
      SQS_QUEUE_URL       = var.HTC_POC_OP_618580_QueueSQS_URL,
    }
  }
  tags = var.common_tags
}




# LAMBDA_FUNCTION_GET CREATION


resource "aws_lambda_function" "HTC_POC_OP_618580_LambdaFunction_GET" {

  filename      = var.HTC_POC_OP_618580_LambdaFunction_GET_FileName_archives
  function_name = var.HTC_POC_OP_618580_LambdaFunction_GET_FunctionName
  role          = var.HTC_POC_OP_618580_LambdaRole_ARN
  handler       = var.HTC_POC_OP_618580_LambdaFunction_GET_Handler
  runtime       = var.HTC_POC_OP_618580_LambdaFunction_Runtime
  environment {
    variables = {
      DYNAMODB_TABLE_NAME = var.HTC_POC_OP_618580_DynamoDBTable_Name
    }
  }
  tags = var.common_tags
}


# LAMBDA_FUNCTION_LAMBDA-AUTHORIZER CREATION


resource "aws_lambda_function" "HTC_POC_OP_618580_LambdaTokenAuthorizer" {

  filename      = var.HTC_POC_OP_618580_LambdaTokenAuthorizer_FileName_archives
  function_name = var.HTC_POC_OP_618580_LambdaTokenAuthorizer_FunctionName
  role          = var.HTC_POC_OP_618580_LambdaRoleForAuthorizer_ARN
  handler       = var.HTC_POC_OP_618580_LambdaTokenAuthorizer_Handler
  runtime       = var.HTC_POC_OP_618580_LambdaFunction_Runtime
  tags          = var.common_tags
}


# LAMBDA_EVENT_SOURCE_MAPPING CREATION

resource "aws_lambda_event_source_mapping" "HTC_POC_OP_618580_LambdaTrigger" {
  event_source_arn                   = var.HTC_POC_OP_618580_QueueSQS_ARN
  function_name                      = aws_lambda_function.HTC_POC_OP_618580_LambdaFunction_CRUD.function_name
  batch_size                         = var.HTC_POC_OP_618580_LambdaTrigger_BatchSize
  maximum_batching_window_in_seconds = var.HTC_POC_OP_618580_LambdaTrigger_MaximumBatchingWindowInSeconds
  depends_on                         = [var.HTC_POC_OP_618580_QueueSQS]
}
