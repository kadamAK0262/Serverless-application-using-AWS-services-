
# ARCHIVE LAMBDA FUNCTION FILES


data "archive_file" "Usecase_LambdaFunction_CRUD_Archive" {
  type        = "zip"
  source_file = var.Usecase_LambdaFunction_CRUD_FileName
  output_path = "${path.module}${var.Usecase_LambdaFunction_CRUD_Archive}.zip"
}

data "archive_file" "Usecase_LambdaFunction_GET_Archive" {
  type        = "zip"
  source_file = var.Usecase_LambdaFunction_GET_FileName
  output_path = "${path.module}${var.Usecase_LambdaFunction_GET_Archive}.zip"
}

data "archive_file" "Usecase_LambdaTokenAuthorizer_Archive" {
  type        = "zip"
  source_file = var.Usecase_LambdaTokenAuthorizer_FileName
  output_path = "${path.module}${var.Usecase_LambdaTokenAuthorizer_Archive}.zip"
}

# LAMBDA_FUNCTION_CRUD CREATION


resource "aws_lambda_function" "Usecase_LambdaFunction_CRUD" {
  filename      = var.Usecase_LambdaFunction_CRUD_FileName_archives
  function_name = var.Usecase_LambdaFunction_CRUD_FunctionName
  role          = var.Usecase_LambdaRole_ARN
  handler       = var.Usecase_LambdaFunction_CRUD_Handler
  runtime       = var.Usecase_LambdaFunction_Runtime

  environment {
    variables = {
      DYNAMODB_TABLE_NAME = var.Usecase_DynamoDBTable_Name,
      SQS_QUEUE_URL       = var.Usecase_QueueSQS_URL,
    }
  }
  tags = var.common_tags
}




# LAMBDA_FUNCTION_GET CREATION


resource "aws_lambda_function" "Usecase_LambdaFunction_GET" {

  filename      = var.Usecase_LambdaFunction_GET_FileName_archives
  function_name = var.Usecase_LambdaFunction_GET_FunctionName
  role          = var.Usecase_LambdaRole_ARN
  handler       = var.Usecase_LambdaFunction_GET_Handler
  runtime       = var.Usecase_LambdaFunction_Runtime
  environment {
    variables = {
      DYNAMODB_TABLE_NAME = var.Usecase_DynamoDBTable_Name
    }
  }
  tags = var.common_tags
}


# LAMBDA_FUNCTION_LAMBDA-AUTHORIZER CREATION


resource "aws_lambda_function" "Usecase_LambdaTokenAuthorizer" {

  filename      = var.Usecase_LambdaTokenAuthorizer_FileName_archives
  function_name = var.Usecase_LambdaTokenAuthorizer_FunctionName
  role          = var.Usecase_LambdaRoleForAuthorizer_ARN
  handler       = var.Usecase_LambdaTokenAuthorizer_Handler
  runtime       = var.Usecase_LambdaFunction_Runtime
  tags          = var.common_tags
}


# LAMBDA_EVENT_SOURCE_MAPPING CREATION

resource "aws_lambda_event_source_mapping" "Usecase_LambdaTrigger" {
  event_source_arn                   = var.Usecase_QueueSQS_ARN
  function_name                      = aws_lambda_function.Usecase_LambdaFunction_CRUD.function_name
  batch_size                         = var.Usecase_LambdaTrigger_BatchSize
  maximum_batching_window_in_seconds = var.Usecase_LambdaTrigger_MaximumBatchingWindowInSeconds
  depends_on                         = [var.Usecase_QueueSQS]
}
