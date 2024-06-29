
# PROVIDER

variable "access_key" {}
variable "secret_key" {}
# variable "region" {}
variable "aws_account" {}
variable "common_tags" {}

# IAM VARIABLES

variable "Usecase_APIGatewayRole_Name" {}
variable "api_gateway_role_policy" {}
variable "Usecase_APIGatewayPolicy_Name" {}
variable "Usecase_APIGatewayPolicy_Description" {}
variable "api_gateway_policy" {}
variable "Usecase_APIGatewayPolicyAttachment_Name" {}
variable "Usecase_LambdaRoleForAuthorizer_Name" {}
variable "lambda_role_policy" {}
variable "Usecase_LambdaFullAccess_Name" {}
variable "Usecase_LambdaFullAccess_PolicyARN" {}
variable "Usecase_APIGatewayCustomPolicy_Name" {}
variable "Usecase_APIGatewayCustomPolicy_Description" {}
variable "api_gateway_custom_policy" {}
variable "Usecase_APIPolicyAttachment_Name" {}
variable "Usecase_LambdaRole_Name" {}
variable "lambdarole" {}
variable "Usecase_LambdaDynamoDBPolicyAttachment_Name" {}
variable "Usecase_LambdaDynamoDBPolicyAttachment_PolicyARN" {}
variable "Usecase_LambdaSQSPolicy_Name" {}
variable "Usecase_LambdaSQSPolicy_Description" {}
variable "lambda_sqs_policy" {}
variable "Usecase_CloudWatchPolicy_Name" {}
variable "Usecase_CloudWatchPolicy_Description" {}
variable "cloudwatch_policy" {}
variable "Usecase_CloudWatchPolicyAttachment_Name" {}



# variable "policy_arn_APIGateway" {}
# variable "policy_arn_API" {}
# variable "policy_arn_Lambda" {}
# variable "policy_arn_CloudWatch" {}

# variable "APIGateway_Role_Name" {}
# variable "Auth_Role_Name" {}
# variable "Lambda_Role_Name" {}


# API_GATEWAY VARIABLES


variable "Usecase_LambdaTokenAuthorizer_Name" {}
variable "Usecase_LambdaTokenAuthorizer_Type" {}
variable "Usecase_LambdaTokenAuthorizer_IdentitySource" {}
variable "Usecase_APIGateway_Name" {}
variable "Usecase_APIGateway_Description" {}
variable "Usecase_APIGateway_EndpointType" {}
variable "Usecase_APIGateway_Resource_PathPart" {}
variable "Usecase_APIGateway_RequestValidator_Name" {}
variable "Usecase_APIGateway_RequestValidator_ValidateRequestBody" {}
variable "Usecase_APIGateway_HTTPMETHOD" {}
variable "Usecase_APIGateway_Method_Authorization" {}
variable "Usecase_APIGateway_Integration_TYPE" {}
variable "Usecase_APIGateway_Integration_RequestTemplates" {}
variable "Usecase_APIGateway_Integration_RequestParameters" {}
variable "Usecase_APIGateway_IntegrationResponse_Post_ResponseTemplate" {}
variable "Usecase_APIGateway_IntegrationResponse_PUT_ResponseTemplate" {}
variable "Usecase_APIGateway_MethodResponse_DELETE_ResponseTemplate" {}
variable "Usecase_APIGateway_MethodResponse_StatusCode" {}
variable "Usecase_APIGateway_Method_PUT_HttpMethod" {}
variable "Usecase_APIGateway_Method_DELETE_HttpMethod" {}
variable "Usecase_APIGateway_Invoke_GET_StatementID" {}
variable "Usecase_APIGateway_Invoke_GET_Action" {}
variable "Usecase_APIGateway_Invoke_GET_Principle" {}
variable "Usecase_Method_GET_HttpMethod" {}
variable "Usecase_Integration_GET_Type" {}
variable "Usecase_Integration_GET_ApplicationJson" {}
variable "Usecase_MethodResponse_GET_ResponseModels" {}
variable "Usecase_IntegrationResponse_GET_ResponseTemplate" {}
variable "Usecase_APIGatewayDeployment_StageName" {}

variable "arn_apigateway" {}
variable "Usecase_QueueSQS_path" {}


# DYNAMO_DB VARIABLES

variable "Usecase_DynamoDBTable_Name" {}
variable "Usecase_DynamoDBTable_BillingMode" {}
variable "Usecase_DynamoDBTable_HashKey" {}
variable "Usecase_DynamoDBTable_AttributeType" {}


# SQS_QUEUE VARIABLES

variable "Usecase_QueueSQS_Name" {}
variable "Usecase_QueueSQS_DelaySeconds" {}
variable "Usecase_QueueSQS_MaxMessageSize" {}
variable "Usecase_QueueSQS_MessageRetentionSeconds" {}
variable "Usecase_QueueSQS_VisisbilityTimeoutSeconds" {}
variable "Usecase_QueueSQS_ReceiveWaitTimeSeconds" {}


# LAMBDA_PACKAGE VARIABLES

variable "Usecase_LambdaFunction_CRUD_FileName" {}
variable "Usecase_LambdaFunction_CRUD_FunctionName" {}
variable "Usecase_LambdaFunction_CRUD_Handler" {}
variable "Usecase_LambdaFunction_Runtime" {}
variable "Usecase_LambdaFunction_GET_FileName" {}
variable "Usecase_LambdaFunction_GET_FunctionName" {}
variable "Usecase_LambdaFunction_GET_Handler" {}
variable "Usecase_LambdaTokenAuthorizer_FileName" {}
variable "Usecase_LambdaTokenAuthorizer_FunctionName" {}
variable "Usecase_LambdaTokenAuthorizer_Handler" {}
variable "Usecase_LambdaTrigger_BatchSize" {}
variable "Usecase_LambdaTrigger_MaximumBatchingWindowInSeconds" {}

variable "Usecase_LambdaFunction_CRUD_FileName_archives" {}
variable "Usecase_LambdaFunction_GET_FileName_archives" {}
variable "Usecase_LambdaTokenAuthorizer_FileName_archives" {}

variable "Usecase_LambdaFunction_CRUD_Archive" {}
variable "Usecase_LambdaFunction_GET_Archive" {}
variable "Usecase_LambdaTokenAuthorizer_Archive" {}
