output "Usecase_QueueSQS_ARN" {
  value = aws_sqs_queue.Usecase_QueueSQS.arn
}

output "Usecase_QueueSQS" {
  value = aws_sqs_queue.Usecase_QueueSQS
}

output "Usecase_QueueSQS_URL" {
  value = aws_sqs_queue.Usecase_QueueSQS.id
}
  
