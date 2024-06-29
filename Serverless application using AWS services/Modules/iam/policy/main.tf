# Api Gateway

resource "aws_iam_policy" "Usecase_APIGatewayPolicy" {
  name        = var.Usecase_APIGatewayPolicy_Name
  description = var.Usecase_APIGatewayPolicy_Description

  policy = file("${path.module}${var.api_gateway_policy}")
}

# lambda Auth
resource "aws_iam_policy" "Usecase_APIGatewayCustomPolicy" {
  name        = var.Usecase_APIGatewayCustomPolicy_Name
  description = var.Usecase_APIGatewayCustomPolicy_Description

  policy = file("${path.module}${var.api_gateway_custom_policy}")
}

# Lambda

resource "aws_iam_policy" "Usecase_LambdaSQSPolicy" {
  name        = var.Usecase_LambdaSQSPolicy_Name
  description = var.Usecase_LambdaSQSPolicy_Description

  policy = file("${path.module}${var.lambda_sqs_policy}")
}

resource "aws_iam_policy" "Usecase_CloudWatchPolicy" {
  name        = var.Usecase_CloudWatchPolicy_Name
  description = var.Usecase_CloudWatchPolicy_Description
  policy      = file("${path.module}${var.cloudwatch_policy}")

}

