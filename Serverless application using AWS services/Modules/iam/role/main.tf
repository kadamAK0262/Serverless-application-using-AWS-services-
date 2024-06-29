# API Gateway 

resource "aws_iam_role" "Usecase_APIGatewayRole" {
  name = var.Usecase_APIGatewayRole_Name

  assume_role_policy = file("${path.module}${var.api_gateway_role_policy}")
  tags               = var.common_tags
}


# Lambda Auth

resource "aws_iam_role" "Usecase_LambdaRoleForAuthorizer" {
  name               = var.Usecase_LambdaRoleForAuthorizer_Name
  assume_role_policy = file("${path.module}${var.lambda_role_policy}")
  tags               = var.common_tags
}

# Lambda

resource "aws_iam_role" "Usecase_LambdaRole" {
  name = var.Usecase_LambdaRole_Name

  assume_role_policy = file("${path.module}${var.lambdarole}")
  tags               = var.common_tags
}
