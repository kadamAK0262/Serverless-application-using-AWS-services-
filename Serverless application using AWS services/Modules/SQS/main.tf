# SQS_QUEUE-SECTION          


resource "aws_sqs_queue" "HTC_POC_OP_618580_QueueSQS" {
  name                       = var.HTC_POC_OP_618580_QueueSQS_Name
  delay_seconds              = var.HTC_POC_OP_618580_QueueSQS_DelaySeconds
  max_message_size           = var.HTC_POC_OP_618580_QueueSQS_MaxMessageSize
  message_retention_seconds  = var.HTC_POC_OP_618580_QueueSQS_MessageRetentionSeconds
  visibility_timeout_seconds = var.HTC_POC_OP_618580_QueueSQS_VisisbilityTimeoutSeconds
  receive_wait_time_seconds  = var.HTC_POC_OP_618580_QueueSQS_ReceiveWaitTimeSeconds
  tags                       = var.common_tags
  

}
