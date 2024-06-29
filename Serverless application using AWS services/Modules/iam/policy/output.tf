output "policy_arn_APIGateway" {
  value = aws_iam_policy.Usecase_APIGatewayCustomPolicy.arn
}

output "policy_arn_API" {
  value = aws_iam_policy.Usecase_APIGatewayCustomPolicy.arn
}

output "policy_arn_Lambda" {
  value = aws_iam_policy.Usecase_LambdaSQSPolicy.arn
}

output "policy_arn_CloudWatch" {
  value = aws_iam_policy.Usecase_CloudWatchPolicy.arn
}
