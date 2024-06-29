
# PROVIDER


access_key  = "your_aws_access_key"
secret_key  = "your_aws_secret_key"
aws_account = "your_aws_account_no."
# provideraws = ">= 2.0"

common_tags = {
  Name    = "My Usecase for practice"
  Project = "ORDERPROCESSING"
  Owner   = "AKSHAY"
}


# IAM TF_VARS


Usecase_APIGatewayRole_Name                      = "Usecase_APIGatewayRole"
api_gateway_role_policy                          = "/policies/api_gateway_role_policy.json"
Usecase_APIGatewayPolicy_Name                    = "Usecase_APIGatewayPolicy"
Usecase_APIGatewayPolicy_Description             = "Policy for Usecase_APIGatewayRole"
api_gateway_policy                               = "/policies/api_gateway_policy.json"
Usecase_APIGatewayPolicyAttachment_Name          = "Usecase_APIGatewayPolicyAttachment"
Usecase_LambdaRoleForAuthorizer_Name             = "Usecase_LambdaRoleForAuthorizer"
lambda_role_policy                               = "/policies/lambda_role_policy.json"
Usecase_LambdaFullAccess_Name                    = "Usecase_LambdaFullAccess"
Usecase_LambdaFullAccess_PolicyARN               = "arn:aws:iam::aws:policy/AWSLambda_FullAccess"
Usecase_APIGatewayCustomPolicy_Name              = "Usecase_APIGatewayCustomPolicy"
Usecase_APIGatewayCustomPolicy_Description       = "Custom IAM policy for API Gateway full access"
api_gateway_custom_policy                        = "/policies/api_gateway_custom_policy.json"
Usecase_APIPolicyAttachment_Name                 = "Usecase_APIPolicyAttachment"
Usecase_LambdaRole_Name                          = "Usecase_LambdaRole"
lambdarole                                       = "/policies/lambdarole.json"
Usecase_LambdaDynamoDBPolicyAttachment_Name      = "Usecase_LambdaDynamoDBPolicyAttachment"
Usecase_LambdaDynamoDBPolicyAttachment_PolicyARN = "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"
Usecase_LambdaSQSPolicy_Name                     = "Usecase_LambdaSQSPolicy"
Usecase_LambdaSQSPolicy_Description              = "Policy for Lambda function"
lambda_sqs_policy                                = "/policies/lambda_sqs_policy.json"
Usecase_CloudWatchPolicy_Name                    = "Usecase_CloudWatchPolicy"
Usecase_CloudWatchPolicy_Description             = "Policy to allow Lambda to write logs to CloudWatch Logs"
cloudwatch_policy                                = "/policies/cloudwatch_policy.json"
Usecase_CloudWatchPolicyAttachment_Name          = "Usecase_CloudWatchPolicyAttachment"


# API_GATEWAY TF_VARS


Usecase_LambdaTokenAuthorizer_Name                           = "Usecase_LambdaTokenAuthorizer"
Usecase_LambdaTokenAuthorizer_Type                           = "TOKEN"
Usecase_LambdaTokenAuthorizer_IdentitySource                 = "method.request.header.authorizationToken"
Usecase_APIGateway_Name                                      = "Usecase_APIGateway"
Usecase_APIGateway_Description                               = "REST API for Usecase_APIGateway"
Usecase_APIGateway_EndpointType                              = "REGIONAL"
Usecase_APIGateway_Resource_PathPart                         = "orders"
Usecase_APIGateway_RequestValidator_Name                     = "Usecase_APIGateway_RequestValidator"
Usecase_APIGateway_RequestValidator_ValidateRequestBody      = true
Usecase_APIGateway_HTTPMETHOD                                = "POST"
Usecase_APIGateway_Method_Authorization                      = "CUSTOM"
Usecase_APIGateway_Integration_TYPE                          = "AWS"
Usecase_APIGateway_Integration_RequestTemplates              = "Action=SendMessage&MessageBody=$input.body"
Usecase_APIGateway_Integration_RequestParameters             = "'application/x-www-form-urlencoded'"
Usecase_APIGateway_IntegrationResponse_Post_ResponseTemplate = "{\"message\": \"Post request is successfully go to SQS!\"}"
Usecase_APIGateway_IntegrationResponse_PUT_ResponseTemplate  = "{\"message\": \"PUT request is successfull go to SQS!\"}"
Usecase_APIGateway_MethodResponse_DELETE_ResponseTemplate    = "{\"message\": \"DELETE request is successfull go to SQS!\"}"
Usecase_APIGateway_MethodResponse_StatusCode                 = "200"
Usecase_APIGateway_Method_PUT_HttpMethod                     = "PUT"
Usecase_APIGateway_Method_DELETE_HttpMethod                  = "DELETE"
Usecase_APIGateway_Invoke_GET_StatementID                    = "Usecase_APIGateway_Invoke_GET"
Usecase_APIGateway_Invoke_GET_Action                         = "lambda:InvokeFunction"
Usecase_APIGateway_Invoke_GET_Principle                      = "apigateway.amazonaws.com"
Usecase_Method_GET_HttpMethod                                = "GET"
Usecase_Integration_GET_Type                                 = "AWS_PROXY"
Usecase_Integration_GET_ApplicationJson                      = "{\"statusCode\": 200}"
Usecase_MethodResponse_GET_ResponseModels                    = "Empty"
Usecase_IntegrationResponse_GET_ResponseTemplate             = ""
Usecase_APIGatewayDeployment_StageName                       = "prod"

arn_apigateway        = "arn:aws:apigateway:"
Usecase_QueueSQS_path = ":sqs:path/your_aws_account_no/Usecase_QueueSQS"


# DYNAMO_DB TF_VARS


Usecase_DynamoDBTable_Name          = "Usecase_DynamoDBTable"
Usecase_DynamoDBTable_BillingMode   = "PAY_PER_REQUEST"
Usecase_DynamoDBTable_HashKey       = "order_id"
Usecase_DynamoDBTable_AttributeType = "N"


# SQS_QUEUE TF_VARS


Usecase_QueueSQS_Name                      = "Usecase_QueueSQS"
Usecase_QueueSQS_DelaySeconds              = 0
Usecase_QueueSQS_MaxMessageSize            = 262144
Usecase_QueueSQS_MessageRetentionSeconds   = 345600
Usecase_QueueSQS_VisisbilityTimeoutSeconds = 5
Usecase_QueueSQS_ReceiveWaitTimeSeconds    = 0


# LAMBDA_PACKAGE TF_VARS

Usecase_LambdaFunction_CRUD_FileName                 = "./Modules/Lambda/Lambda_Code/Crud.py"
Usecase_LambdaFunction_CRUD_FunctionName             = "Usecase_LambdaFunction_CRUD"
Usecase_LambdaFunction_CRUD_Handler                  = "Crud.lambda_handler"
Usecase_LambdaFunction_Runtime                       = "python3.8"
Usecase_LambdaFunction_GET_FileName                  = "./Modules/Lambda/Lambda_Code/getApi.py"
Usecase_LambdaFunction_GET_FunctionName              = "Usecase_LambdaFunction_GET"
Usecase_LambdaFunction_GET_Handler                   = "getApi.lambda_handler"
Usecase_LambdaTokenAuthorizer_FileName               = "./Modules/Lambda/Lambda_Code/Authorizer.py"
Usecase_LambdaTokenAuthorizer_FunctionName           = "Usecase_LambdaTokenAuthorizer"
Usecase_LambdaTokenAuthorizer_Handler                = "Authorizer.lambda_handler"
Usecase_LambdaTrigger_BatchSize                      = 10
Usecase_LambdaTrigger_MaximumBatchingWindowInSeconds = 0

Usecase_LambdaFunction_CRUD_FileName_archives   = "./Modules/Lambda/ZipFolder/Crud.zip"
Usecase_LambdaFunction_GET_FileName_archives    = "./Modules/Lambda/ZipFolder/getApi.zip"
Usecase_LambdaTokenAuthorizer_FileName_archives = "./Modules/Lambda/ZipFolder/Authorizer.zip"

Usecase_LambdaFunction_CRUD_Archive   = "/ZipFolder/Crud.zip"
Usecase_LambdaFunction_GET_Archive    = "/ZipFolder/getApi.zip"
Usecase_LambdaTokenAuthorizer_Archive = "/ZipFolder/Authorizer.zip"

