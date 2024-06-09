output "APIGateway_Role_Name" {
  value = aws_iam_role.HTC_POC_OP_618580_APIGatewayRole.name
}


output "Auth_Role_Name" {
  value = aws_iam_role.HTC_POC_OP_618580_LambdaRoleForAuthorizer.name
}

output "Lambda_Role_Name" {
  value = aws_iam_role.HTC_POC_OP_618580_LambdaRole.name
}


output "HTC_POC_OP_618580_LambdaRoleForAuthorizer_ARN" {
  value = aws_iam_role.HTC_POC_OP_618580_LambdaRoleForAuthorizer.arn
}

output "HTC_POC_OP_618580_APIGatewayRole_ARN" {
  value = aws_iam_role.HTC_POC_OP_618580_APIGatewayRole.arn
}

output "HTC_POC_OP_618580_LambdaRole_ARN" {
  value = aws_iam_role.HTC_POC_OP_618580_LambdaRole.arn
}
