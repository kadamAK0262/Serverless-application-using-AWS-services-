output "APIGateway_Role_Name" {
  value = aws_iam_role.Usecase_APIGatewayRole.name
}


output "Auth_Role_Name" {
  value = aws_iam_role.Usecase_LambdaRoleForAuthorizer.name
}

output "Lambda_Role_Name" {
  value = aws_iam_role.Usecase_LambdaRole.name
}


output "Usecase_LambdaRoleForAuthorizer_ARN" {
  value = aws_iam_role.Usecase_LambdaRoleForAuthorizer.arn
}

output "Usecase_APIGatewayRole_ARN" {
  value = aws_iam_role.Usecase_APIGatewayRole.arn
}

output "Usecase_LambdaRole_ARN" {
  value = aws_iam_role.Usecase_LambdaRole.arn
}
