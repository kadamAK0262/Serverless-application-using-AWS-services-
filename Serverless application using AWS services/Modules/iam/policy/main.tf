# Api Gateway

resource "aws_iam_policy" "HTC_POC_OP_618580_APIGatewayPolicy" {
  name        = var.HTC_POC_OP_618580_APIGatewayPolicy_Name
  description = var.HTC_POC_OP_618580_APIGatewayPolicy_Description

  policy = file("${path.module}${var.api_gateway_policy}")
}

# lambda Auth
resource "aws_iam_policy" "HTC_POC_OP_618580_APIGatewayCustomPolicy" {
  name        = var.HTC_POC_OP_618580_APIGatewayCustomPolicy_Name
  description = var.HTC_POC_OP_618580_APIGatewayCustomPolicy_Description

  policy = file("${path.module}${var.api_gateway_custom_policy}")
}

# Lambda

resource "aws_iam_policy" "HTC_POC_OP_618580_LambdaSQSPolicy" {
  name        = var.HTC_POC_OP_618580_LambdaSQSPolicy_Name
  description = var.HTC_POC_OP_618580_LambdaSQSPolicy_Description

  policy = file("${path.module}${var.lambda_sqs_policy}")
}

resource "aws_iam_policy" "HTC_POC_OP_618580_CloudWatchPolicy" {
  name        = var.HTC_POC_OP_618580_CloudWatchPolicy_Name
  description = var.HTC_POC_OP_618580_CloudWatchPolicy_Description
  policy      = file("${path.module}${var.cloudwatch_policy}")

}

