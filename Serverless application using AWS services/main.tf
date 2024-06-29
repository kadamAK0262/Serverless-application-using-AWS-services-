
# us-east-2

# IAM MODULE


module "iam_us-east-2" {
  source = "./Global/modules/iam"

  providers = {
    aws = aws.us-east-2

  }

  # policy

  Usecase_APIGatewayPolicy_Name              = var.Usecase_APIGatewayPolicy_Name
  Usecase_APIGatewayPolicy_Description       = var.Usecase_APIGatewayPolicy_Description
  api_gateway_policy                         = var.api_gateway_policy
  Usecase_APIGatewayCustomPolicy_Name        = var.Usecase_APIGatewayCustomPolicy_Name
  Usecase_APIGatewayCustomPolicy_Description = var.Usecase_APIGatewayCustomPolicy_Description
  api_gateway_custom_policy                  = var.api_gateway_custom_policy
  Usecase_LambdaSQSPolicy_Name               = var.Usecase_LambdaSQSPolicy_Name
  Usecase_LambdaSQSPolicy_Description        = var.Usecase_LambdaSQSPolicy_Description
  lambda_sqs_policy                          = var.lambda_sqs_policy
  Usecase_CloudWatchPolicy_Name              = var.Usecase_CloudWatchPolicy_Name
  Usecase_CloudWatchPolicy_Description       = var.Usecase_CloudWatchPolicy_Description
  cloudwatch_policy                          = var.cloudwatch_policy


  # Attached policy

  Usecase_APIGatewayPolicyAttachment_Name = var.Usecase_APIGatewayPolicyAttachment_Name

  Usecase_LambdaFullAccess_Name      = var.Usecase_LambdaFullAccess_Name
  Usecase_LambdaFullAccess_PolicyARN = var.Usecase_LambdaFullAccess_PolicyARN

  Usecase_APIPolicyAttachment_Name = var.Usecase_APIPolicyAttachment_Name

  Usecase_LambdaDynamoDBPolicyAttachment_Name      = var.Usecase_LambdaDynamoDBPolicyAttachment_Name
  Usecase_LambdaDynamoDBPolicyAttachment_PolicyARN = var.Usecase_LambdaDynamoDBPolicyAttachment_PolicyARN

  Usecase_CloudWatchPolicyAttachment_Name = var.Usecase_CloudWatchPolicyAttachment_Name




  # Role

  Usecase_APIGatewayRole_Name          = var.Usecase_APIGatewayRole_Name
  api_gateway_role_policy              = var.api_gateway_role_policy
  Usecase_LambdaRoleForAuthorizer_Name = var.Usecase_LambdaRoleForAuthorizer_Name
  lambda_role_policy                   = var.lambda_role_policy
  Usecase_LambdaRole_Name              = var.Usecase_LambdaRole_Name
  lambdarole                           = var.lambdarole
  common_tags                          = var.common_tags



}


# DYNAMO_DB MODULE

module "dynamo_db_us-east-2" {

  source = "./Modules/dynamodb"
  providers = {
    aws = aws.us-east-2

  }

  Usecase_DynamoDBTable_Name          = var.Usecase_DynamoDBTable_Name
  Usecase_DynamoDBTable_BillingMode   = var.Usecase_DynamoDBTable_BillingMode
  Usecase_DynamoDBTable_HashKey       = var.Usecase_DynamoDBTable_HashKey
  Usecase_DynamoDBTable_AttributeType = var.Usecase_DynamoDBTable_AttributeType
  common_tags                         = var.common_tags

}


# API_GATEWAY MODULE


module "api_gateway_us-east-2" {
  source = "./Modules/apigateway"
  providers = {
    aws = aws.us-east-2

  }

  Usecase_LambdaTokenAuthorizer_InvokeARN = module.lambda_package_us-east-2.Usecase_LambdaTokenAuthorizer_InvokeARN
  Usecase_LambdaFunction_GET_FunctionName = module.lambda_package_us-east-2.Usecase_LambdaFunction_GET_FunctionName
  Usecase_LambdaFunction_GET_ARN          = module.lambda_package_us-east-2.Usecase_LambdaFunction_GET_ARN

  Usecase_LambdaTokenAuthorizer_Name                           = var.Usecase_LambdaTokenAuthorizer_Name
  Usecase_LambdaTokenAuthorizer_Type                           = var.Usecase_LambdaTokenAuthorizer_Type
  Usecase_LambdaTokenAuthorizer_IdentitySource                 = var.Usecase_LambdaTokenAuthorizer_IdentitySource
  Usecase_APIGateway_Name                                      = var.Usecase_APIGateway_Name
  Usecase_APIGateway_Description                               = var.Usecase_APIGateway_Description
  Usecase_APIGateway_EndpointType                              = var.Usecase_APIGateway_EndpointType
  Usecase_APIGateway_Resource_PathPart                         = var.Usecase_APIGateway_Resource_PathPart
  Usecase_APIGateway_RequestValidator_Name                     = var.Usecase_APIGateway_RequestValidator_Name
  Usecase_APIGateway_RequestValidator_ValidateRequestBody      = var.Usecase_APIGateway_RequestValidator_ValidateRequestBody
  Usecase_APIGateway_HTTPMETHOD                                = var.Usecase_APIGateway_HTTPMETHOD
  Usecase_APIGateway_Method_Authorization                      = var.Usecase_APIGateway_Method_Authorization
  Usecase_APIGateway_Integration_TYPE                          = var.Usecase_APIGateway_Integration_TYPE
  Usecase_APIGateway_Integration_RequestTemplates              = var.Usecase_APIGateway_Integration_RequestTemplates
  Usecase_APIGateway_Integration_RequestParameters             = var.Usecase_APIGateway_Integration_RequestParameters
  Usecase_APIGateway_IntegrationResponse_Post_ResponseTemplate = var.Usecase_APIGateway_IntegrationResponse_Post_ResponseTemplate
  Usecase_APIGateway_IntegrationResponse_PUT_ResponseTemplate  = var.Usecase_APIGateway_IntegrationResponse_PUT_ResponseTemplate
  Usecase_APIGateway_MethodResponse_DELETE_ResponseTemplate    = var.Usecase_APIGateway_MethodResponse_DELETE_ResponseTemplate
  Usecase_APIGateway_MethodResponse_StatusCode                 = var.Usecase_APIGateway_MethodResponse_StatusCode
  Usecase_APIGateway_Method_PUT_HttpMethod                     = var.Usecase_APIGateway_Method_PUT_HttpMethod
  Usecase_APIGateway_Method_DELETE_HttpMethod                  = var.Usecase_APIGateway_Method_DELETE_HttpMethod
  Usecase_APIGateway_Invoke_GET_StatementID                    = var.Usecase_APIGateway_Invoke_GET_StatementID
  Usecase_APIGateway_Invoke_GET_Action                         = var.Usecase_APIGateway_Invoke_GET_Action
  Usecase_APIGateway_Invoke_GET_Principle                      = var.Usecase_APIGateway_Invoke_GET_Principle
  Usecase_Method_GET_HttpMethod                                = var.Usecase_Method_GET_HttpMethod
  Usecase_Integration_GET_Type                                 = var.Usecase_Integration_GET_Type
  Usecase_Integration_GET_ApplicationJson                      = var.Usecase_Integration_GET_ApplicationJson
  Usecase_MethodResponse_GET_ResponseModels                    = var.Usecase_MethodResponse_GET_ResponseModels
  Usecase_IntegrationResponse_GET_ResponseTemplate             = var.Usecase_IntegrationResponse_GET_ResponseTemplate
  Usecase_APIGatewayDeployment_StageName                       = var.Usecase_APIGatewayDeployment_StageName
  Usecase_APIGatewayRole_ARN                                   = module.iam_us-east-2.Usecase_APIGatewayRole_ARN
  Usecase_LambdaRoleForAuthorizer_ARN                          = module.iam_us-east-2.Usecase_LambdaRoleForAuthorizer_ARN
  arn_apigateway                                               = var.arn_apigateway
  Usecase_QueueSQS_path                                        = var.Usecase_QueueSQS_path
  aws_account                                                  = var.aws_account
  common_tags                                                  = var.common_tags


}


# SQS MODULE

module "sqs_us-east-2" {
  source = "./Modules/SQS"
  providers = {
    aws = aws.us-east-2

  }

  Usecase_APIGateway_Execution_ARN           = module.api_gateway_us-east-2.Usecase_APIGateway_Execution_ARN
  Usecase_QueueSQS_Name                      = var.Usecase_QueueSQS_Name
  Usecase_QueueSQS_DelaySeconds              = var.Usecase_QueueSQS_DelaySeconds
  Usecase_QueueSQS_MaxMessageSize            = var.Usecase_QueueSQS_MaxMessageSize
  Usecase_QueueSQS_MessageRetentionSeconds   = var.Usecase_QueueSQS_MessageRetentionSeconds
  Usecase_QueueSQS_VisisbilityTimeoutSeconds = var.Usecase_QueueSQS_VisisbilityTimeoutSeconds
  Usecase_QueueSQS_ReceiveWaitTimeSeconds    = var.Usecase_QueueSQS_ReceiveWaitTimeSeconds
  Usecase_QueueSQS_ARN                       = module.sqs_us-east-2.Usecase_QueueSQS_ARN
  common_tags                                = var.common_tags

}


# LAMBDA_PACKAGE MODULE

module "lambda_package_us-east-2" {
  source = "./Modules/Lambda"
  providers = {
    aws = aws.us-east-2

  }

  Usecase_QueueSQS_ARN                                 = module.sqs_us-east-2.Usecase_QueueSQS_ARN
  Usecase_LambdaRoleForAuthorizer_ARN                  = module.iam_us-east-2.Usecase_LambdaRoleForAuthorizer_ARN
  Usecase_QueueSQS                                     = module.sqs_us-east-2.Usecase_QueueSQS
  Usecase_DynamoDBTable_Name                           = module.dynamo_db_us-east-2.Usecase_DynamoDBTable_Name
  Usecase_QueueSQS_URL                                 = module.sqs_us-east-2.Usecase_QueueSQS_URL
  Usecase_LambdaFunction_CRUD_FileName                 = var.Usecase_LambdaFunction_CRUD_FileName
  Usecase_LambdaFunction_CRUD_FunctionName             = var.Usecase_LambdaFunction_CRUD_FunctionName
  Usecase_LambdaFunction_CRUD_Handler                  = var.Usecase_LambdaFunction_CRUD_Handler
  Usecase_LambdaFunction_Runtime                       = var.Usecase_LambdaFunction_Runtime
  Usecase_LambdaFunction_GET_FileName                  = var.Usecase_LambdaFunction_GET_FileName
  Usecase_LambdaFunction_GET_FunctionName              = var.Usecase_LambdaFunction_GET_FunctionName
  Usecase_LambdaFunction_GET_Handler                   = var.Usecase_LambdaFunction_GET_Handler
  Usecase_LambdaTokenAuthorizer_FileName               = var.Usecase_LambdaTokenAuthorizer_FileName
  Usecase_LambdaTokenAuthorizer_FunctionName           = var.Usecase_LambdaTokenAuthorizer_FunctionName
  Usecase_LambdaTokenAuthorizer_Handler                = var.Usecase_LambdaTokenAuthorizer_Handler
  Usecase_LambdaTrigger_BatchSize                      = var.Usecase_LambdaTrigger_BatchSize
  Usecase_LambdaTrigger_MaximumBatchingWindowInSeconds = var.Usecase_LambdaTrigger_MaximumBatchingWindowInSeconds
  Usecase_LambdaRole_ARN                               = module.iam_us-east-2.Usecase_LambdaRole_ARN
  Usecase_LambdaFunction_CRUD_FileName_archives        = var.Usecase_LambdaFunction_CRUD_FileName_archives
  Usecase_LambdaFunction_GET_FileName_archives         = var.Usecase_LambdaFunction_GET_FileName_archives
  Usecase_LambdaTokenAuthorizer_FileName_archives      = var.Usecase_LambdaTokenAuthorizer_FileName_archives
  Usecase_LambdaFunction_CRUD_Archive                  = var.Usecase_LambdaFunction_CRUD_Archive
  Usecase_LambdaFunction_GET_Archive                   = var.Usecase_LambdaFunction_GET_Archive
  Usecase_LambdaTokenAuthorizer_Archive                = var.Usecase_LambdaTokenAuthorizer_Archive
  common_tags                                          = var.common_tags

}



# us-west-2




# DYNAMO_DB MODULE

module "dynamo_db_us-west-2" {

  source = "./Modules/dynamodb"
  providers = {
    aws = aws.us-west-2

  }

  Usecase_DynamoDBTable_Name          = var.Usecase_DynamoDBTable_Name
  Usecase_DynamoDBTable_BillingMode   = var.Usecase_DynamoDBTable_BillingMode
  Usecase_DynamoDBTable_HashKey       = var.Usecase_DynamoDBTable_HashKey
  Usecase_DynamoDBTable_AttributeType = var.Usecase_DynamoDBTable_AttributeType
  common_tags                         = var.common_tags

}


# API_GATEWAY MODULE


module "api_gateway_us-west-2" {
  source = "./Modules/apigateway"
  providers = {
    aws = aws.us-west-2

  }

  Usecase_LambdaTokenAuthorizer_InvokeARN = module.lambda_package_us-west-2.Usecase_LambdaTokenAuthorizer_InvokeARN
  Usecase_LambdaFunction_GET_FunctionName = module.lambda_package_us-west-2.Usecase_LambdaFunction_GET_FunctionName
  Usecase_LambdaFunction_GET_ARN          = module.lambda_package_us-west-2.Usecase_LambdaFunction_GET_ARN

  Usecase_LambdaTokenAuthorizer_Name                           = var.Usecase_LambdaTokenAuthorizer_Name
  Usecase_LambdaTokenAuthorizer_Type                           = var.Usecase_LambdaTokenAuthorizer_Type
  Usecase_LambdaTokenAuthorizer_IdentitySource                 = var.Usecase_LambdaTokenAuthorizer_IdentitySource
  Usecase_APIGateway_Name                                      = var.Usecase_APIGateway_Name
  Usecase_APIGateway_Description                               = var.Usecase_APIGateway_Description
  Usecase_APIGateway_EndpointType                              = var.Usecase_APIGateway_EndpointType
  Usecase_APIGateway_Resource_PathPart                         = var.Usecase_APIGateway_Resource_PathPart
  Usecase_APIGateway_RequestValidator_Name                     = var.Usecase_APIGateway_RequestValidator_Name
  Usecase_APIGateway_RequestValidator_ValidateRequestBody      = var.Usecase_APIGateway_RequestValidator_ValidateRequestBody
  Usecase_APIGateway_HTTPMETHOD                                = var.Usecase_APIGateway_HTTPMETHOD
  Usecase_APIGateway_Method_Authorization                      = var.Usecase_APIGateway_Method_Authorization
  Usecase_APIGateway_Integration_TYPE                          = var.Usecase_APIGateway_Integration_TYPE
  Usecase_APIGateway_Integration_RequestTemplates              = var.Usecase_APIGateway_Integration_RequestTemplates
  Usecase_APIGateway_Integration_RequestParameters             = var.Usecase_APIGateway_Integration_RequestParameters
  Usecase_APIGateway_IntegrationResponse_Post_ResponseTemplate = var.Usecase_APIGateway_IntegrationResponse_Post_ResponseTemplate
  Usecase_APIGateway_IntegrationResponse_PUT_ResponseTemplate  = var.Usecase_APIGateway_IntegrationResponse_PUT_ResponseTemplate
  Usecase_APIGateway_MethodResponse_DELETE_ResponseTemplate    = var.Usecase_APIGateway_MethodResponse_DELETE_ResponseTemplate
  Usecase_APIGateway_MethodResponse_StatusCode                 = var.Usecase_APIGateway_MethodResponse_StatusCode
  Usecase_APIGateway_Method_PUT_HttpMethod                     = var.Usecase_APIGateway_Method_PUT_HttpMethod
  Usecase_APIGateway_Method_DELETE_HttpMethod                  = var.Usecase_APIGateway_Method_DELETE_HttpMethod
  Usecase_APIGateway_Invoke_GET_StatementID                    = var.Usecase_APIGateway_Invoke_GET_StatementID
  Usecase_APIGateway_Invoke_GET_Action                         = var.Usecase_APIGateway_Invoke_GET_Action
  Usecase_APIGateway_Invoke_GET_Principle                      = var.Usecase_APIGateway_Invoke_GET_Principle
  Usecase_Method_GET_HttpMethod                                = var.Usecase_Method_GET_HttpMethod
  Usecase_Integration_GET_Type                                 = var.Usecase_Integration_GET_Type
  Usecase_Integration_GET_ApplicationJson                      = var.Usecase_Integration_GET_ApplicationJson
  Usecase_MethodResponse_GET_ResponseModels                    = var.Usecase_MethodResponse_GET_ResponseModels
  Usecase_IntegrationResponse_GET_ResponseTemplate             = var.Usecase_IntegrationResponse_GET_ResponseTemplate
  Usecase_APIGatewayDeployment_StageName                       = var.Usecase_APIGatewayDeployment_StageName
  Usecase_APIGatewayRole_ARN                                   = module.iam_us-east-2.Usecase_APIGatewayRole_ARN
  Usecase_LambdaRoleForAuthorizer_ARN                          = module.iam_us-east-2.Usecase_LambdaRoleForAuthorizer_ARN
  arn_apigateway                                               = var.arn_apigateway
  Usecase_QueueSQS_path                                        = var.Usecase_QueueSQS_path
  aws_account                                                  = var.aws_account
  common_tags                                                  = var.common_tags

}


# SQS MODULE

module "sqs_us-west-2" {
  source = "./Modules/SQS"
  providers = {
    aws = aws.us-west-2

  }

  Usecase_APIGateway_Execution_ARN           = module.api_gateway_us-west-2.Usecase_APIGateway_Execution_ARN
  Usecase_QueueSQS_Name                      = var.Usecase_QueueSQS_Name
  Usecase_QueueSQS_DelaySeconds              = var.Usecase_QueueSQS_DelaySeconds
  Usecase_QueueSQS_MaxMessageSize            = var.Usecase_QueueSQS_MaxMessageSize
  Usecase_QueueSQS_MessageRetentionSeconds   = var.Usecase_QueueSQS_MessageRetentionSeconds
  Usecase_QueueSQS_VisisbilityTimeoutSeconds = var.Usecase_QueueSQS_VisisbilityTimeoutSeconds
  Usecase_QueueSQS_ReceiveWaitTimeSeconds    = var.Usecase_QueueSQS_ReceiveWaitTimeSeconds
  Usecase_QueueSQS_ARN                       = module.sqs_us-west-2.Usecase_QueueSQS_ARN
  common_tags                                = var.common_tags

}


# LAMBDA_PACKAGE MODULE

module "lambda_package_us-west-2" {
  source = "./Modules/Lambda"
  providers = {
    aws = aws.us-west-2

  }

  Usecase_QueueSQS_ARN                                 = module.sqs_us-west-2.Usecase_QueueSQS_ARN
  Usecase_LambdaRoleForAuthorizer_ARN                  = module.iam_us-east-2.Usecase_LambdaRoleForAuthorizer_ARN
  Usecase_QueueSQS                                     = module.sqs_us-west-2.Usecase_QueueSQS
  Usecase_DynamoDBTable_Name                           = module.dynamo_db_us-west-2.Usecase_DynamoDBTable_Name
  Usecase_QueueSQS_URL                                 = module.sqs_us-west-2.Usecase_QueueSQS_URL
  Usecase_LambdaFunction_CRUD_FileName                 = var.Usecase_LambdaFunction_CRUD_FileName
  Usecase_LambdaFunction_CRUD_FunctionName             = var.Usecase_LambdaFunction_CRUD_FunctionName
  Usecase_LambdaFunction_CRUD_Handler                  = var.Usecase_LambdaFunction_CRUD_Handler
  Usecase_LambdaFunction_Runtime                       = var.Usecase_LambdaFunction_Runtime
  Usecase_LambdaFunction_GET_FileName                  = var.Usecase_LambdaFunction_GET_FileName
  Usecase_LambdaFunction_GET_FunctionName              = var.Usecase_LambdaFunction_GET_FunctionName
  Usecase_LambdaFunction_GET_Handler                   = var.Usecase_LambdaFunction_GET_Handler
  Usecase_LambdaTokenAuthorizer_FileName               = var.Usecase_LambdaTokenAuthorizer_FileName
  Usecase_LambdaTokenAuthorizer_FunctionName           = var.Usecase_LambdaTokenAuthorizer_FunctionName
  Usecase_LambdaTokenAuthorizer_Handler                = var.Usecase_LambdaTokenAuthorizer_Handler
  Usecase_LambdaTrigger_BatchSize                      = var.Usecase_LambdaTrigger_BatchSize
  Usecase_LambdaTrigger_MaximumBatchingWindowInSeconds = var.Usecase_LambdaTrigger_MaximumBatchingWindowInSeconds
  Usecase_LambdaRole_ARN                               = module.iam_us-east-2.Usecase_LambdaRole_ARN
  Usecase_LambdaFunction_CRUD_FileName_archives        = var.Usecase_LambdaFunction_CRUD_FileName_archives
  Usecase_LambdaFunction_GET_FileName_archives         = var.Usecase_LambdaFunction_GET_FileName_archives
  Usecase_LambdaTokenAuthorizer_FileName_archives      = var.Usecase_LambdaTokenAuthorizer_FileName_archives
  Usecase_LambdaFunction_CRUD_Archive                  = var.Usecase_LambdaFunction_CRUD_Archive
  Usecase_LambdaFunction_GET_Archive                   = var.Usecase_LambdaFunction_GET_Archive
  Usecase_LambdaTokenAuthorizer_Archive                = var.Usecase_LambdaTokenAuthorizer_Archive
  common_tags                                          = var.common_tags
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
