output "Usecase_LambdaTokenAuthorizer_InvokeARN" {
  value = aws_lambda_function.Usecase_LambdaTokenAuthorizer.invoke_arn
}

output "Usecase_LambdaFunction_GET_FunctionName" {
  value = aws_lambda_function.Usecase_LambdaFunction_GET.function_name
}

output "Usecase_LambdaFunction_GET_ARN" {
  value = aws_lambda_function.Usecase_LambdaFunction_GET.arn
}
