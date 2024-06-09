# IAM VARIABLES

variable "HTC_POC_OP_618580_APIGatewayRole_Name" {}
variable "api_gateway_role_policy" {}
variable "HTC_POC_OP_618580_APIGatewayPolicy_Name" {}
variable "HTC_POC_OP_618580_APIGatewayPolicy_Description" {}
variable "api_gateway_policy" {}
variable "HTC_POC_OP_618580_APIGatewayPolicyAttachment_Name" {}
variable "HTC_POC_OP_618580_LambdaRoleForAuthorizer_Name" {}
variable "lambda_role_policy" {}
variable "HTC_POC_OP_618580_LambdaFullAccess_Name" {}
variable "HTC_POC_OP_618580_LambdaFullAccess_PolicyARN" {}
variable "HTC_POC_OP_618580_APIGatewayCustomPolicy_Name" {}
variable "HTC_POC_OP_618580_APIGatewayCustomPolicy_Description" {}
variable "api_gateway_custom_policy" {}
variable "HTC_POC_OP_618580_APIPolicyAttachment_Name" {}
variable "HTC_POC_OP_618580_LambdaRole_Name" {}
variable "lambdarole" {}
variable "HTC_POC_OP_618580_LambdaDynamoDBPolicyAttachment_Name" {}
variable "HTC_POC_OP_618580_LambdaDynamoDBPolicyAttachment_PolicyARN" {}
variable "HTC_POC_OP_618580_LambdaSQSPolicy_Name" {}
variable "HTC_POC_OP_618580_LambdaSQSPolicy_Description" {}
variable "lambda_sqs_policy" {}
variable "HTC_POC_OP_618580_CloudWatchPolicy_Name" {}
variable "HTC_POC_OP_618580_CloudWatchPolicy_Description" {}
variable "cloudwatch_policy" {}
variable "HTC_POC_OP_618580_CloudWatchPolicyAttachment_Name" {}
variable "common_tags" {}


# $$$$$$$$$$$$$$$$$$$$$$$$$$
# variable "policy_arn_APIGateway" {}
# variable "policy_arn_API" {}
# variable "policy_arn_Lambda" {}
# variable "policy_arn_CloudWatch" {}

# variable "APIGateway_Role_Name" {}
# variable "Auth_Role_Name" {}
# variable "Lambda_Role_Name" {}