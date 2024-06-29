# SQS_QUEUE-SECTION          


resource "aws_sqs_queue" "Usecase_QueueSQS" {
  name                       = var.Usecase_QueueSQS_Name
  delay_seconds              = var.Usecase_QueueSQS_DelaySeconds
  max_message_size           = var.Usecase_QueueSQS_MaxMessageSize
  message_retention_seconds  = var.Usecase_QueueSQS_MessageRetentionSeconds
  visibility_timeout_seconds = var.Usecase_QueueSQS_VisisbilityTimeoutSeconds
  receive_wait_time_seconds  = var.Usecase_QueueSQS_ReceiveWaitTimeSeconds
  tags                       = var.common_tags


}
