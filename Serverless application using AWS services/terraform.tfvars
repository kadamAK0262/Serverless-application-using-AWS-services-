
# PROVIDER


access_key  = "your_aws_access_key"
secret_key  = "your_aws_secret_key"
aws_account = "your_aws_account_no."
# provideraws = ">= 2.0"

common_tags = {
  Name    = "HTC_POC_ORDERPROCESSING_618580"
  Project = "ORDERPROCESSING"
  Owner   = "AKSHAY"
}


# IAM TF_VARS


HTC_POC_OP_618580_APIGatewayRole_Name                      = "HTC_POC_OP_618580_APIGatewayRole"
api_gateway_role_policy                                    = "/policies/api_gateway_role_policy.json"
HTC_POC_OP_618580_APIGatewayPolicy_Name                    = "HTC_POC_OP_618580_APIGatewayPolicy"
HTC_POC_OP_618580_APIGatewayPolicy_Description             = "Policy for HTC_POC_OP_618580_APIGatewayRole"
api_gateway_policy                                         = "/policies/api_gateway_policy.json"
HTC_POC_OP_618580_APIGatewayPolicyAttachment_Name          = "HTC_POC_OP_618580_APIGatewayPolicyAttachment"
HTC_POC_OP_618580_LambdaRoleForAuthorizer_Name             = "HTC_POC_OP_618580_LambdaRoleForAuthorizer"
lambda_role_policy                                         = "/policies/lambda_role_policy.json"
HTC_POC_OP_618580_LambdaFullAccess_Name                    = "HTC_POC_OP_618580_LambdaFullAccess"
HTC_POC_OP_618580_LambdaFullAccess_PolicyARN               = "arn:aws:iam::aws:policy/AWSLambda_FullAccess"
HTC_POC_OP_618580_APIGatewayCustomPolicy_Name              = "HTC_POC_OP_618580_APIGatewayCustomPolicy"
HTC_POC_OP_618580_APIGatewayCustomPolicy_Description       = "Custom IAM policy for API Gateway full access"
api_gateway_custom_policy                                  = "/policies/api_gateway_custom_policy.json"
HTC_POC_OP_618580_APIPolicyAttachment_Name                 = "HTC_POC_OP_618580_APIPolicyAttachment"
HTC_POC_OP_618580_LambdaRole_Name                          = "HTC_POC_OP_618580_LambdaRole"
lambdarole                                                 = "/policies/lambdarole.json"
HTC_POC_OP_618580_LambdaDynamoDBPolicyAttachment_Name      = "HTC_POC_OP_618580_LambdaDynamoDBPolicyAttachment"
HTC_POC_OP_618580_LambdaDynamoDBPolicyAttachment_PolicyARN = "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"
HTC_POC_OP_618580_LambdaSQSPolicy_Name                     = "HTC_POC_OP_618580_LambdaSQSPolicy"
HTC_POC_OP_618580_LambdaSQSPolicy_Description              = "Policy for Lambda function"
lambda_sqs_policy                                          = "/policies/lambda_sqs_policy.json"
HTC_POC_OP_618580_CloudWatchPolicy_Name                    = "HTC_POC_OP_618580_CloudWatchPolicy"
HTC_POC_OP_618580_CloudWatchPolicy_Description             = "Policy to allow Lambda to write logs to CloudWatch Logs"
cloudwatch_policy                                          = "/policies/cloudwatch_policy.json"
HTC_POC_OP_618580_CloudWatchPolicyAttachment_Name          = "HTC_POC_OP_618580_CloudWatchPolicyAttachment"


# API_GATEWAY TF_VARS


HTC_POC_OP_618580_LambdaTokenAuthorizer_Name                           = "HTC_POC_OP_618580_LambdaTokenAuthorizer"
HTC_POC_OP_618580_LambdaTokenAuthorizer_Type                           = "TOKEN"
HTC_POC_OP_618580_LambdaTokenAuthorizer_IdentitySource                 = "method.request.header.authorizationToken"
HTC_POC_OP_618580_APIGateway_Name                                      = "HTC_POC_OP_618580_APIGateway"
HTC_POC_OP_618580_APIGateway_Description                               = "REST API for HTC_POC_OP_618580_APIGateway"
HTC_POC_OP_618580_APIGateway_EndpointType                              = "REGIONAL"
HTC_POC_OP_618580_APIGateway_Resource_PathPart                         = "orders"
HTC_POC_OP_618580_APIGateway_RequestValidator_Name                     = "HTC_POC_OP_618580_APIGateway_RequestValidator"
HTC_POC_OP_618580_APIGateway_RequestValidator_ValidateRequestBody      = true
HTC_POC_OP_618580_APIGateway_HTTPMETHOD                                = "POST"
HTC_POC_OP_618580_APIGateway_Method_Authorization                      = "CUSTOM"
HTC_POC_OP_618580_APIGateway_Integration_TYPE                          = "AWS"
HTC_POC_OP_618580_APIGateway_Integration_RequestTemplates              = "Action=SendMessage&MessageBody=$input.body"
HTC_POC_OP_618580_APIGateway_Integration_RequestParameters             = "'application/x-www-form-urlencoded'"
HTC_POC_OP_618580_APIGateway_IntegrationResponse_Post_ResponseTemplate = "{\"message\": \"Post request is successfully go to SQS!\"}"
HTC_POC_OP_618580_APIGateway_IntegrationResponse_PUT_ResponseTemplate  = "{\"message\": \"PUT request is successfull go to SQS!\"}"
HTC_POC_OP_618580_APIGateway_MethodResponse_DELETE_ResponseTemplate    = "{\"message\": \"DELETE request is successfull go to SQS!\"}"
HTC_POC_OP_618580_APIGateway_MethodResponse_StatusCode                 = "200"
HTC_POC_OP_618580_APIGateway_Method_PUT_HttpMethod                     = "PUT"
HTC_POC_OP_618580_APIGateway_Method_DELETE_HttpMethod                  = "DELETE"
HTC_POC_OP_618580_APIGateway_Invoke_GET_StatementID                    = "HTC_POC_OP_618580_APIGateway_Invoke_GET"
HTC_POC_OP_618580_APIGateway_Invoke_GET_Action                         = "lambda:InvokeFunction"
HTC_POC_OP_618580_APIGateway_Invoke_GET_Principle                      = "apigateway.amazonaws.com"
HTC_POC_OP_618580_Method_GET_HttpMethod                                = "GET"
HTC_POC_OP_618580_Integration_GET_Type                                 = "AWS_PROXY"
HTC_POC_OP_618580_Integration_GET_ApplicationJson                      = "{\"statusCode\": 200}"
HTC_POC_OP_618580_MethodResponse_GET_ResponseModels                    = "Empty"
HTC_POC_OP_618580_IntegrationResponse_GET_ResponseTemplate             = ""
HTC_POC_OP_618580_APIGatewayDeployment_StageName                       = "prod"

arn_apigateway                  = "arn:aws:apigateway:"
HTC_POC_OP_618580_QueueSQS_path = ":sqs:path/your_aws_account_no/HTC_POC_OP_618580_QueueSQS"


# DYNAMO_DB TF_VARS


HTC_POC_OP_618580_DynamoDBTable_Name          = "HTC_POC_OP_618580_DynamoDBTable"
HTC_POC_OP_618580_DynamoDBTable_BillingMode   = "PAY_PER_REQUEST"
HTC_POC_OP_618580_DynamoDBTable_HashKey       = "order_id"
HTC_POC_OP_618580_DynamoDBTable_AttributeType = "N"


# SQS_QUEUE TF_VARS


HTC_POC_OP_618580_QueueSQS_Name                      = "HTC_POC_OP_618580_QueueSQS"
HTC_POC_OP_618580_QueueSQS_DelaySeconds              = 0
HTC_POC_OP_618580_QueueSQS_MaxMessageSize            = 262144
HTC_POC_OP_618580_QueueSQS_MessageRetentionSeconds   = 345600
HTC_POC_OP_618580_QueueSQS_VisisbilityTimeoutSeconds = 5
HTC_POC_OP_618580_QueueSQS_ReceiveWaitTimeSeconds    = 0


# LAMBDA_PACKAGE TF_VARS

HTC_POC_OP_618580_LambdaFunction_CRUD_FileName                 = "./Modules/Lambda/Lambda_Code/Crud.py"
HTC_POC_OP_618580_LambdaFunction_CRUD_FunctionName             = "HTC_POC_OP_618580_LambdaFunction_CRUD"
HTC_POC_OP_618580_LambdaFunction_CRUD_Handler                  = "Crud.lambda_handler"
HTC_POC_OP_618580_LambdaFunction_Runtime                       = "python3.8"
HTC_POC_OP_618580_LambdaFunction_GET_FileName                  = "./Modules/Lambda/Lambda_Code/getApi.py"
HTC_POC_OP_618580_LambdaFunction_GET_FunctionName              = "HTC_POC_OP_618580_LambdaFunction_GET"
HTC_POC_OP_618580_LambdaFunction_GET_Handler                   = "getApi.lambda_handler"
HTC_POC_OP_618580_LambdaTokenAuthorizer_FileName               = "./Modules/Lambda/Lambda_Code/Authorizer.py"
HTC_POC_OP_618580_LambdaTokenAuthorizer_FunctionName           = "HTC_POC_OP_618580_LambdaTokenAuthorizer"
HTC_POC_OP_618580_LambdaTokenAuthorizer_Handler                = "Authorizer.lambda_handler"
HTC_POC_OP_618580_LambdaTrigger_BatchSize                      = 10
HTC_POC_OP_618580_LambdaTrigger_MaximumBatchingWindowInSeconds = 0

HTC_POC_OP_618580_LambdaFunction_CRUD_FileName_archives   = "./Modules/Lambda/ZipFolder/Crud.zip"
HTC_POC_OP_618580_LambdaFunction_GET_FileName_archives    = "./Modules/Lambda/ZipFolder/getApi.zip"
HTC_POC_OP_618580_LambdaTokenAuthorizer_FileName_archives = "./Modules/Lambda/ZipFolder/Authorizer.zip"

HTC_POC_OP_618580_LambdaFunction_CRUD_Archive   = "/ZipFolder/Crud.zip"
HTC_POC_OP_618580_LambdaFunction_GET_Archive    = "/ZipFolder/getApi.zip"
HTC_POC_OP_618580_LambdaTokenAuthorizer_Archive = "/ZipFolder/Authorizer.zip"

