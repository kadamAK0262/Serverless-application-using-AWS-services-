
# us-east-2

# IAM MODULE


module "iam_us-east-2" {
  source = "./Global/modules/iam"

  providers = {
    aws = aws.us-east-2

  }

  # policy

  HTC_POC_OP_618580_APIGatewayPolicy_Name                    = var.HTC_POC_OP_618580_APIGatewayPolicy_Name
  HTC_POC_OP_618580_APIGatewayPolicy_Description             = var.HTC_POC_OP_618580_APIGatewayPolicy_Description
  api_gateway_policy                                         = var.api_gateway_policy 
  HTC_POC_OP_618580_APIGatewayCustomPolicy_Name              = var.HTC_POC_OP_618580_APIGatewayCustomPolicy_Name
  HTC_POC_OP_618580_APIGatewayCustomPolicy_Description       = var.HTC_POC_OP_618580_APIGatewayCustomPolicy_Description
  api_gateway_custom_policy                                  = var.api_gateway_custom_policy
  HTC_POC_OP_618580_LambdaSQSPolicy_Name                     = var.HTC_POC_OP_618580_LambdaSQSPolicy_Name
  HTC_POC_OP_618580_LambdaSQSPolicy_Description              = var.HTC_POC_OP_618580_LambdaSQSPolicy_Description
  lambda_sqs_policy                                          = var.lambda_sqs_policy
  HTC_POC_OP_618580_CloudWatchPolicy_Name                    = var.HTC_POC_OP_618580_CloudWatchPolicy_Name
  HTC_POC_OP_618580_CloudWatchPolicy_Description             = var.HTC_POC_OP_618580_CloudWatchPolicy_Description
  cloudwatch_policy                                          = var.cloudwatch_policy

  
# Attached policy

  HTC_POC_OP_618580_APIGatewayPolicyAttachment_Name          = var.HTC_POC_OP_618580_APIGatewayPolicyAttachment_Name
  
  HTC_POC_OP_618580_LambdaFullAccess_Name                    = var.HTC_POC_OP_618580_LambdaFullAccess_Name
  HTC_POC_OP_618580_LambdaFullAccess_PolicyARN               = var.HTC_POC_OP_618580_LambdaFullAccess_PolicyARN
  
  HTC_POC_OP_618580_APIPolicyAttachment_Name                 = var.HTC_POC_OP_618580_APIPolicyAttachment_Name
 
  HTC_POC_OP_618580_LambdaDynamoDBPolicyAttachment_Name      = var.HTC_POC_OP_618580_LambdaDynamoDBPolicyAttachment_Name
  HTC_POC_OP_618580_LambdaDynamoDBPolicyAttachment_PolicyARN = var.HTC_POC_OP_618580_LambdaDynamoDBPolicyAttachment_PolicyARN
  
  HTC_POC_OP_618580_CloudWatchPolicyAttachment_Name          = var.HTC_POC_OP_618580_CloudWatchPolicyAttachment_Name


  

  # Role

  HTC_POC_OP_618580_APIGatewayRole_Name                      = var.HTC_POC_OP_618580_APIGatewayRole_Name
  api_gateway_role_policy                                    = var.api_gateway_role_policy
  HTC_POC_OP_618580_LambdaRoleForAuthorizer_Name             = var.HTC_POC_OP_618580_LambdaRoleForAuthorizer_Name
  lambda_role_policy                                         = var.lambda_role_policy
  HTC_POC_OP_618580_LambdaRole_Name                          = var.HTC_POC_OP_618580_LambdaRole_Name
  lambdarole                                                 = var.lambdarole
  common_tags                                                = var.common_tags


  
}


# DYNAMO_DB MODULE

module "dynamo_db_us-east-2" {

  source = "./Modules/dynamodb"
  providers = {
    aws = aws.us-east-2

  }

  HTC_POC_OP_618580_DynamoDBTable_Name          = var.HTC_POC_OP_618580_DynamoDBTable_Name
  HTC_POC_OP_618580_DynamoDBTable_BillingMode   = var.HTC_POC_OP_618580_DynamoDBTable_BillingMode
  HTC_POC_OP_618580_DynamoDBTable_HashKey       = var.HTC_POC_OP_618580_DynamoDBTable_HashKey
  HTC_POC_OP_618580_DynamoDBTable_AttributeType = var.HTC_POC_OP_618580_DynamoDBTable_AttributeType
  common_tags                                   = var.common_tags

}


# API_GATEWAY MODULE


module "api_gateway_us-east-2" {
  source = "./Modules/apigateway"
  providers = {
    aws = aws.us-east-2

  }

  HTC_POC_OP_618580_LambdaTokenAuthorizer_InvokeARN = module.lambda_package_us-east-2.HTC_POC_OP_618580_LambdaTokenAuthorizer_InvokeARN
  HTC_POC_OP_618580_LambdaFunction_GET_FunctionName = module.lambda_package_us-east-2.HTC_POC_OP_618580_LambdaFunction_GET_FunctionName
  HTC_POC_OP_618580_LambdaFunction_GET_ARN          = module.lambda_package_us-east-2.HTC_POC_OP_618580_LambdaFunction_GET_ARN

  HTC_POC_OP_618580_LambdaTokenAuthorizer_Name                           = var.HTC_POC_OP_618580_LambdaTokenAuthorizer_Name
  HTC_POC_OP_618580_LambdaTokenAuthorizer_Type                           = var.HTC_POC_OP_618580_LambdaTokenAuthorizer_Type
  HTC_POC_OP_618580_LambdaTokenAuthorizer_IdentitySource                 = var.HTC_POC_OP_618580_LambdaTokenAuthorizer_IdentitySource
  HTC_POC_OP_618580_APIGateway_Name                                      = var.HTC_POC_OP_618580_APIGateway_Name
  HTC_POC_OP_618580_APIGateway_Description                               = var.HTC_POC_OP_618580_APIGateway_Description
  HTC_POC_OP_618580_APIGateway_EndpointType                              = var.HTC_POC_OP_618580_APIGateway_EndpointType
  HTC_POC_OP_618580_APIGateway_Resource_PathPart                         = var.HTC_POC_OP_618580_APIGateway_Resource_PathPart
  HTC_POC_OP_618580_APIGateway_RequestValidator_Name                     = var.HTC_POC_OP_618580_APIGateway_RequestValidator_Name
  HTC_POC_OP_618580_APIGateway_RequestValidator_ValidateRequestBody      = var.HTC_POC_OP_618580_APIGateway_RequestValidator_ValidateRequestBody
  HTC_POC_OP_618580_APIGateway_HTTPMETHOD                                = var.HTC_POC_OP_618580_APIGateway_HTTPMETHOD
  HTC_POC_OP_618580_APIGateway_Method_Authorization                      = var.HTC_POC_OP_618580_APIGateway_Method_Authorization
  HTC_POC_OP_618580_APIGateway_Integration_TYPE                          = var.HTC_POC_OP_618580_APIGateway_Integration_TYPE
  HTC_POC_OP_618580_APIGateway_Integration_RequestTemplates              = var.HTC_POC_OP_618580_APIGateway_Integration_RequestTemplates
  HTC_POC_OP_618580_APIGateway_Integration_RequestParameters             = var.HTC_POC_OP_618580_APIGateway_Integration_RequestParameters
  HTC_POC_OP_618580_APIGateway_IntegrationResponse_Post_ResponseTemplate = var.HTC_POC_OP_618580_APIGateway_IntegrationResponse_Post_ResponseTemplate
  HTC_POC_OP_618580_APIGateway_IntegrationResponse_PUT_ResponseTemplate  = var.HTC_POC_OP_618580_APIGateway_IntegrationResponse_PUT_ResponseTemplate
  HTC_POC_OP_618580_APIGateway_MethodResponse_DELETE_ResponseTemplate    = var.HTC_POC_OP_618580_APIGateway_MethodResponse_DELETE_ResponseTemplate
  HTC_POC_OP_618580_APIGateway_MethodResponse_StatusCode                 = var.HTC_POC_OP_618580_APIGateway_MethodResponse_StatusCode
  HTC_POC_OP_618580_APIGateway_Method_PUT_HttpMethod                     = var.HTC_POC_OP_618580_APIGateway_Method_PUT_HttpMethod
  HTC_POC_OP_618580_APIGateway_Method_DELETE_HttpMethod                  = var.HTC_POC_OP_618580_APIGateway_Method_DELETE_HttpMethod
  HTC_POC_OP_618580_APIGateway_Invoke_GET_StatementID                    = var.HTC_POC_OP_618580_APIGateway_Invoke_GET_StatementID
  HTC_POC_OP_618580_APIGateway_Invoke_GET_Action                         = var.HTC_POC_OP_618580_APIGateway_Invoke_GET_Action
  HTC_POC_OP_618580_APIGateway_Invoke_GET_Principle                      = var.HTC_POC_OP_618580_APIGateway_Invoke_GET_Principle
  HTC_POC_OP_618580_Method_GET_HttpMethod                                = var.HTC_POC_OP_618580_Method_GET_HttpMethod
  HTC_POC_OP_618580_Integration_GET_Type                                 = var.HTC_POC_OP_618580_Integration_GET_Type
  HTC_POC_OP_618580_Integration_GET_ApplicationJson                      = var.HTC_POC_OP_618580_Integration_GET_ApplicationJson
  HTC_POC_OP_618580_MethodResponse_GET_ResponseModels                    = var.HTC_POC_OP_618580_MethodResponse_GET_ResponseModels
  HTC_POC_OP_618580_IntegrationResponse_GET_ResponseTemplate             = var.HTC_POC_OP_618580_IntegrationResponse_GET_ResponseTemplate
  HTC_POC_OP_618580_APIGatewayDeployment_StageName                       = var.HTC_POC_OP_618580_APIGatewayDeployment_StageName
  HTC_POC_OP_618580_APIGatewayRole_ARN                                   = module.iam_us-east-2.HTC_POC_OP_618580_APIGatewayRole_ARN
  HTC_POC_OP_618580_LambdaRoleForAuthorizer_ARN                          = module.iam_us-east-2.HTC_POC_OP_618580_LambdaRoleForAuthorizer_ARN
  arn_apigateway                                                         = var.arn_apigateway
  HTC_POC_OP_618580_QueueSQS_path                                        = var.HTC_POC_OP_618580_QueueSQS_path
  aws_account                                                            = var.aws_account
  common_tags                                                            = var.common_tags


}


# SQS MODULE

module "sqs_us-east-2" {
  source = "./Modules/SQS"
  providers = {
    aws = aws.us-east-2

  }

  HTC_POC_OP_618580_APIGateway_Execution_ARN           = module.api_gateway_us-east-2.HTC_POC_OP_618580_APIGateway_Execution_ARN
  HTC_POC_OP_618580_QueueSQS_Name                      = var.HTC_POC_OP_618580_QueueSQS_Name
  HTC_POC_OP_618580_QueueSQS_DelaySeconds              = var.HTC_POC_OP_618580_QueueSQS_DelaySeconds
  HTC_POC_OP_618580_QueueSQS_MaxMessageSize            = var.HTC_POC_OP_618580_QueueSQS_MaxMessageSize
  HTC_POC_OP_618580_QueueSQS_MessageRetentionSeconds   = var.HTC_POC_OP_618580_QueueSQS_MessageRetentionSeconds
  HTC_POC_OP_618580_QueueSQS_VisisbilityTimeoutSeconds = var.HTC_POC_OP_618580_QueueSQS_VisisbilityTimeoutSeconds
  HTC_POC_OP_618580_QueueSQS_ReceiveWaitTimeSeconds    = var.HTC_POC_OP_618580_QueueSQS_ReceiveWaitTimeSeconds
  HTC_POC_OP_618580_QueueSQS_ARN                       = module.sqs_us-east-2.HTC_POC_OP_618580_QueueSQS_ARN
  common_tags                                          = var.common_tags

}


# LAMBDA_PACKAGE MODULE

module "lambda_package_us-east-2" {
  source = "./Modules/Lambda"
  providers = {
    aws = aws.us-east-2

  }

  HTC_POC_OP_618580_QueueSQS_ARN                                 = module.sqs_us-east-2.HTC_POC_OP_618580_QueueSQS_ARN
  HTC_POC_OP_618580_LambdaRoleForAuthorizer_ARN                  = module.iam_us-east-2.HTC_POC_OP_618580_LambdaRoleForAuthorizer_ARN
  HTC_POC_OP_618580_QueueSQS                                     = module.sqs_us-east-2.HTC_POC_OP_618580_QueueSQS
  HTC_POC_OP_618580_DynamoDBTable_Name                           = module.dynamo_db_us-east-2.HTC_POC_OP_618580_DynamoDBTable_Name
  HTC_POC_OP_618580_QueueSQS_URL                                 = module.sqs_us-east-2.HTC_POC_OP_618580_QueueSQS_URL
  HTC_POC_OP_618580_LambdaFunction_CRUD_FileName                 = var.HTC_POC_OP_618580_LambdaFunction_CRUD_FileName
  HTC_POC_OP_618580_LambdaFunction_CRUD_FunctionName             = var.HTC_POC_OP_618580_LambdaFunction_CRUD_FunctionName
  HTC_POC_OP_618580_LambdaFunction_CRUD_Handler                  = var.HTC_POC_OP_618580_LambdaFunction_CRUD_Handler
  HTC_POC_OP_618580_LambdaFunction_Runtime                       = var.HTC_POC_OP_618580_LambdaFunction_Runtime
  HTC_POC_OP_618580_LambdaFunction_GET_FileName                  = var.HTC_POC_OP_618580_LambdaFunction_GET_FileName
  HTC_POC_OP_618580_LambdaFunction_GET_FunctionName              = var.HTC_POC_OP_618580_LambdaFunction_GET_FunctionName
  HTC_POC_OP_618580_LambdaFunction_GET_Handler                   = var.HTC_POC_OP_618580_LambdaFunction_GET_Handler
  HTC_POC_OP_618580_LambdaTokenAuthorizer_FileName               = var.HTC_POC_OP_618580_LambdaTokenAuthorizer_FileName
  HTC_POC_OP_618580_LambdaTokenAuthorizer_FunctionName           = var.HTC_POC_OP_618580_LambdaTokenAuthorizer_FunctionName
  HTC_POC_OP_618580_LambdaTokenAuthorizer_Handler                = var.HTC_POC_OP_618580_LambdaTokenAuthorizer_Handler
  HTC_POC_OP_618580_LambdaTrigger_BatchSize                      = var.HTC_POC_OP_618580_LambdaTrigger_BatchSize
  HTC_POC_OP_618580_LambdaTrigger_MaximumBatchingWindowInSeconds = var.HTC_POC_OP_618580_LambdaTrigger_MaximumBatchingWindowInSeconds
  HTC_POC_OP_618580_LambdaRole_ARN                               = module.iam_us-east-2.HTC_POC_OP_618580_LambdaRole_ARN
  HTC_POC_OP_618580_LambdaFunction_CRUD_FileName_archives        = var.HTC_POC_OP_618580_LambdaFunction_CRUD_FileName_archives
  HTC_POC_OP_618580_LambdaFunction_GET_FileName_archives         = var.HTC_POC_OP_618580_LambdaFunction_GET_FileName_archives
  HTC_POC_OP_618580_LambdaTokenAuthorizer_FileName_archives      = var.HTC_POC_OP_618580_LambdaTokenAuthorizer_FileName_archives
  HTC_POC_OP_618580_LambdaFunction_CRUD_Archive                  = var.HTC_POC_OP_618580_LambdaFunction_CRUD_Archive
  HTC_POC_OP_618580_LambdaFunction_GET_Archive                   = var.HTC_POC_OP_618580_LambdaFunction_GET_Archive
  HTC_POC_OP_618580_LambdaTokenAuthorizer_Archive                = var.HTC_POC_OP_618580_LambdaTokenAuthorizer_Archive
  common_tags                                                    = var.common_tags

}



# us-west-2




# DYNAMO_DB MODULE

module "dynamo_db_us-west-2" {

  source = "./Modules/dynamodb"
  providers = {
    aws = aws.us-west-2

  }

  HTC_POC_OP_618580_DynamoDBTable_Name          = var.HTC_POC_OP_618580_DynamoDBTable_Name
  HTC_POC_OP_618580_DynamoDBTable_BillingMode   = var.HTC_POC_OP_618580_DynamoDBTable_BillingMode
  HTC_POC_OP_618580_DynamoDBTable_HashKey       = var.HTC_POC_OP_618580_DynamoDBTable_HashKey
  HTC_POC_OP_618580_DynamoDBTable_AttributeType = var.HTC_POC_OP_618580_DynamoDBTable_AttributeType
  common_tags                                   = var.common_tags

}


# API_GATEWAY MODULE


module "api_gateway_us-west-2" {
  source = "./Modules/apigateway"
  providers = {
    aws = aws.us-west-2

  }

  HTC_POC_OP_618580_LambdaTokenAuthorizer_InvokeARN = module.lambda_package_us-west-2.HTC_POC_OP_618580_LambdaTokenAuthorizer_InvokeARN
  HTC_POC_OP_618580_LambdaFunction_GET_FunctionName = module.lambda_package_us-west-2.HTC_POC_OP_618580_LambdaFunction_GET_FunctionName
  HTC_POC_OP_618580_LambdaFunction_GET_ARN          = module.lambda_package_us-west-2.HTC_POC_OP_618580_LambdaFunction_GET_ARN

  HTC_POC_OP_618580_LambdaTokenAuthorizer_Name                           = var.HTC_POC_OP_618580_LambdaTokenAuthorizer_Name
  HTC_POC_OP_618580_LambdaTokenAuthorizer_Type                           = var.HTC_POC_OP_618580_LambdaTokenAuthorizer_Type
  HTC_POC_OP_618580_LambdaTokenAuthorizer_IdentitySource                 = var.HTC_POC_OP_618580_LambdaTokenAuthorizer_IdentitySource
  HTC_POC_OP_618580_APIGateway_Name                                      = var.HTC_POC_OP_618580_APIGateway_Name
  HTC_POC_OP_618580_APIGateway_Description                               = var.HTC_POC_OP_618580_APIGateway_Description
  HTC_POC_OP_618580_APIGateway_EndpointType                              = var.HTC_POC_OP_618580_APIGateway_EndpointType
  HTC_POC_OP_618580_APIGateway_Resource_PathPart                         = var.HTC_POC_OP_618580_APIGateway_Resource_PathPart
  HTC_POC_OP_618580_APIGateway_RequestValidator_Name                     = var.HTC_POC_OP_618580_APIGateway_RequestValidator_Name
  HTC_POC_OP_618580_APIGateway_RequestValidator_ValidateRequestBody      = var.HTC_POC_OP_618580_APIGateway_RequestValidator_ValidateRequestBody
  HTC_POC_OP_618580_APIGateway_HTTPMETHOD                                = var.HTC_POC_OP_618580_APIGateway_HTTPMETHOD
  HTC_POC_OP_618580_APIGateway_Method_Authorization                      = var.HTC_POC_OP_618580_APIGateway_Method_Authorization
  HTC_POC_OP_618580_APIGateway_Integration_TYPE                          = var.HTC_POC_OP_618580_APIGateway_Integration_TYPE
  HTC_POC_OP_618580_APIGateway_Integration_RequestTemplates              = var.HTC_POC_OP_618580_APIGateway_Integration_RequestTemplates
  HTC_POC_OP_618580_APIGateway_Integration_RequestParameters             = var.HTC_POC_OP_618580_APIGateway_Integration_RequestParameters
  HTC_POC_OP_618580_APIGateway_IntegrationResponse_Post_ResponseTemplate = var.HTC_POC_OP_618580_APIGateway_IntegrationResponse_Post_ResponseTemplate
  HTC_POC_OP_618580_APIGateway_IntegrationResponse_PUT_ResponseTemplate  = var.HTC_POC_OP_618580_APIGateway_IntegrationResponse_PUT_ResponseTemplate
  HTC_POC_OP_618580_APIGateway_MethodResponse_DELETE_ResponseTemplate    = var.HTC_POC_OP_618580_APIGateway_MethodResponse_DELETE_ResponseTemplate
  HTC_POC_OP_618580_APIGateway_MethodResponse_StatusCode                 = var.HTC_POC_OP_618580_APIGateway_MethodResponse_StatusCode
  HTC_POC_OP_618580_APIGateway_Method_PUT_HttpMethod                     = var.HTC_POC_OP_618580_APIGateway_Method_PUT_HttpMethod
  HTC_POC_OP_618580_APIGateway_Method_DELETE_HttpMethod                  = var.HTC_POC_OP_618580_APIGateway_Method_DELETE_HttpMethod
  HTC_POC_OP_618580_APIGateway_Invoke_GET_StatementID                    = var.HTC_POC_OP_618580_APIGateway_Invoke_GET_StatementID
  HTC_POC_OP_618580_APIGateway_Invoke_GET_Action                         = var.HTC_POC_OP_618580_APIGateway_Invoke_GET_Action
  HTC_POC_OP_618580_APIGateway_Invoke_GET_Principle                      = var.HTC_POC_OP_618580_APIGateway_Invoke_GET_Principle
  HTC_POC_OP_618580_Method_GET_HttpMethod                                = var.HTC_POC_OP_618580_Method_GET_HttpMethod
  HTC_POC_OP_618580_Integration_GET_Type                                 = var.HTC_POC_OP_618580_Integration_GET_Type
  HTC_POC_OP_618580_Integration_GET_ApplicationJson                      = var.HTC_POC_OP_618580_Integration_GET_ApplicationJson
  HTC_POC_OP_618580_MethodResponse_GET_ResponseModels                    = var.HTC_POC_OP_618580_MethodResponse_GET_ResponseModels
  HTC_POC_OP_618580_IntegrationResponse_GET_ResponseTemplate             = var.HTC_POC_OP_618580_IntegrationResponse_GET_ResponseTemplate
  HTC_POC_OP_618580_APIGatewayDeployment_StageName                       = var.HTC_POC_OP_618580_APIGatewayDeployment_StageName
  HTC_POC_OP_618580_APIGatewayRole_ARN                                   = module.iam_us-east-2.HTC_POC_OP_618580_APIGatewayRole_ARN
  HTC_POC_OP_618580_LambdaRoleForAuthorizer_ARN                          = module.iam_us-east-2.HTC_POC_OP_618580_LambdaRoleForAuthorizer_ARN
  arn_apigateway                                                         = var.arn_apigateway
  HTC_POC_OP_618580_QueueSQS_path                                        = var.HTC_POC_OP_618580_QueueSQS_path
  aws_account                                                            = var.aws_account
  common_tags                                                            = var.common_tags

}


# SQS MODULE

module "sqs_us-west-2" {
  source = "./Modules/SQS"
  providers = {
    aws = aws.us-west-2

  }

  HTC_POC_OP_618580_APIGateway_Execution_ARN           = module.api_gateway_us-west-2.HTC_POC_OP_618580_APIGateway_Execution_ARN
  HTC_POC_OP_618580_QueueSQS_Name                      = var.HTC_POC_OP_618580_QueueSQS_Name
  HTC_POC_OP_618580_QueueSQS_DelaySeconds              = var.HTC_POC_OP_618580_QueueSQS_DelaySeconds
  HTC_POC_OP_618580_QueueSQS_MaxMessageSize            = var.HTC_POC_OP_618580_QueueSQS_MaxMessageSize
  HTC_POC_OP_618580_QueueSQS_MessageRetentionSeconds   = var.HTC_POC_OP_618580_QueueSQS_MessageRetentionSeconds
  HTC_POC_OP_618580_QueueSQS_VisisbilityTimeoutSeconds = var.HTC_POC_OP_618580_QueueSQS_VisisbilityTimeoutSeconds
  HTC_POC_OP_618580_QueueSQS_ReceiveWaitTimeSeconds    = var.HTC_POC_OP_618580_QueueSQS_ReceiveWaitTimeSeconds
  HTC_POC_OP_618580_QueueSQS_ARN                       = module.sqs_us-west-2.HTC_POC_OP_618580_QueueSQS_ARN
  common_tags                                          = var.common_tags

}


# LAMBDA_PACKAGE MODULE

module "lambda_package_us-west-2" {
  source = "./Modules/Lambda"
  providers = {
    aws = aws.us-west-2

  }

  HTC_POC_OP_618580_QueueSQS_ARN                                 = module.sqs_us-west-2.HTC_POC_OP_618580_QueueSQS_ARN
  HTC_POC_OP_618580_LambdaRoleForAuthorizer_ARN                  = module.iam_us-east-2.HTC_POC_OP_618580_LambdaRoleForAuthorizer_ARN
  HTC_POC_OP_618580_QueueSQS                                     = module.sqs_us-west-2.HTC_POC_OP_618580_QueueSQS
  HTC_POC_OP_618580_DynamoDBTable_Name                           = module.dynamo_db_us-west-2.HTC_POC_OP_618580_DynamoDBTable_Name
  HTC_POC_OP_618580_QueueSQS_URL                                 = module.sqs_us-west-2.HTC_POC_OP_618580_QueueSQS_URL
  HTC_POC_OP_618580_LambdaFunction_CRUD_FileName                 = var.HTC_POC_OP_618580_LambdaFunction_CRUD_FileName
  HTC_POC_OP_618580_LambdaFunction_CRUD_FunctionName             = var.HTC_POC_OP_618580_LambdaFunction_CRUD_FunctionName
  HTC_POC_OP_618580_LambdaFunction_CRUD_Handler                  = var.HTC_POC_OP_618580_LambdaFunction_CRUD_Handler
  HTC_POC_OP_618580_LambdaFunction_Runtime                       = var.HTC_POC_OP_618580_LambdaFunction_Runtime
  HTC_POC_OP_618580_LambdaFunction_GET_FileName                  = var.HTC_POC_OP_618580_LambdaFunction_GET_FileName
  HTC_POC_OP_618580_LambdaFunction_GET_FunctionName              = var.HTC_POC_OP_618580_LambdaFunction_GET_FunctionName
  HTC_POC_OP_618580_LambdaFunction_GET_Handler                   = var.HTC_POC_OP_618580_LambdaFunction_GET_Handler
  HTC_POC_OP_618580_LambdaTokenAuthorizer_FileName               = var.HTC_POC_OP_618580_LambdaTokenAuthorizer_FileName
  HTC_POC_OP_618580_LambdaTokenAuthorizer_FunctionName           = var.HTC_POC_OP_618580_LambdaTokenAuthorizer_FunctionName
  HTC_POC_OP_618580_LambdaTokenAuthorizer_Handler                = var.HTC_POC_OP_618580_LambdaTokenAuthorizer_Handler
  HTC_POC_OP_618580_LambdaTrigger_BatchSize                      = var.HTC_POC_OP_618580_LambdaTrigger_BatchSize
  HTC_POC_OP_618580_LambdaTrigger_MaximumBatchingWindowInSeconds = var.HTC_POC_OP_618580_LambdaTrigger_MaximumBatchingWindowInSeconds
  HTC_POC_OP_618580_LambdaRole_ARN                               = module.iam_us-east-2.HTC_POC_OP_618580_LambdaRole_ARN
  HTC_POC_OP_618580_LambdaFunction_CRUD_FileName_archives        = var.HTC_POC_OP_618580_LambdaFunction_CRUD_FileName_archives
  HTC_POC_OP_618580_LambdaFunction_GET_FileName_archives         = var.HTC_POC_OP_618580_LambdaFunction_GET_FileName_archives
  HTC_POC_OP_618580_LambdaTokenAuthorizer_FileName_archives      = var.HTC_POC_OP_618580_LambdaTokenAuthorizer_FileName_archives
  HTC_POC_OP_618580_LambdaFunction_CRUD_Archive                  = var.HTC_POC_OP_618580_LambdaFunction_CRUD_Archive
  HTC_POC_OP_618580_LambdaFunction_GET_Archive                   = var.HTC_POC_OP_618580_LambdaFunction_GET_Archive
  HTC_POC_OP_618580_LambdaTokenAuthorizer_Archive                = var.HTC_POC_OP_618580_LambdaTokenAuthorizer_Archive
  common_tags                                                    = var.common_tags
}




# CODECOMMIT MODULE

# module "codecommit_us-east-2" {
#   source = "/cicd_pipeline/code_commit"
#   providers = {
#     aws = aws.us-east-2
#   }

#   repository_name = var.codecommit_repository_name
#   # ... (any other CodeCommit configurations)
# }

# # CODEBUILD MODULE

# module "codebuild_us-east-2" {
#   source = "./cicd_pipeline/code_build"
#   providers = {
#     aws = aws.us-east-2
#   }

#   project_name = var.codebuild_project_name
#   # ... (any other CodeBuild configurations)
# }

# # CODEPIPELINE MODULE

# module "codepipeline_us-east-2" {
#   source = "./cicd_pipeline/code_pipeline"
#   providers = {
#     aws = aws.us-east-2
#   }

#   pipeline_name = var.codepipeline_name
#   # ... (any other CodePipeline configurations)
# }
