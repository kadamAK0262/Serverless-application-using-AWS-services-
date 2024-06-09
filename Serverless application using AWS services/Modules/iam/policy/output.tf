output "policy_arn_APIGateway" {
  value = aws_iam_policy.HTC_POC_OP_618580_APIGatewayCustomPolicy.arn
}

output "policy_arn_API" {
  value = aws_iam_policy.HTC_POC_OP_618580_APIGatewayCustomPolicy.arn
}

output "policy_arn_Lambda" {
  value = aws_iam_policy.HTC_POC_OP_618580_LambdaSQSPolicy.arn
}

output "policy_arn_CloudWatch" {
  value = aws_iam_policy.HTC_POC_OP_618580_CloudWatchPolicy.arn
}