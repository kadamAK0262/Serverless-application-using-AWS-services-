output "HTC_POC_OP_618580_LambdaTokenAuthorizer_InvokeARN" {
  value = aws_lambda_function.HTC_POC_OP_618580_LambdaTokenAuthorizer.invoke_arn
}

output "HTC_POC_OP_618580_LambdaFunction_GET_FunctionName" {
  value = aws_lambda_function.HTC_POC_OP_618580_LambdaFunction_GET.function_name
}

output "HTC_POC_OP_618580_LambdaFunction_GET_ARN" {
  value = aws_lambda_function.HTC_POC_OP_618580_LambdaFunction_GET.arn
}