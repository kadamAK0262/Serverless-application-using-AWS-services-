# API Gateway 

resource "aws_iam_role" "HTC_POC_OP_618580_APIGatewayRole" {
  name = var.HTC_POC_OP_618580_APIGatewayRole_Name

  assume_role_policy = file("${path.module}${var.api_gateway_role_policy}")
  tags               = var.common_tags
}


# Lambda Auth

resource "aws_iam_role" "HTC_POC_OP_618580_LambdaRoleForAuthorizer" {
  name               = var.HTC_POC_OP_618580_LambdaRoleForAuthorizer_Name
  assume_role_policy = file("${path.module}${var.lambda_role_policy}")
  tags               = var.common_tags
}

# Lambda

resource "aws_iam_role" "HTC_POC_OP_618580_LambdaRole" {
  name = var.HTC_POC_OP_618580_LambdaRole_Name

  assume_role_policy = file("${path.module}${var.lambdarole}")
  tags               = var.common_tags
}