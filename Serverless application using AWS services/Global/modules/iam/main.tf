module "policy" {
  source = "../../../Modules/iam/policy"

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

}

module "attach_policy" {
  source = "../../../Modules/iam/attach_policy"

  HTC_POC_OP_618580_APIGatewayPolicyAttachment_Name          = var.HTC_POC_OP_618580_APIGatewayPolicyAttachment_Name
  
  HTC_POC_OP_618580_LambdaFullAccess_Name                    = var.HTC_POC_OP_618580_LambdaFullAccess_Name
  HTC_POC_OP_618580_LambdaFullAccess_PolicyARN               = var.HTC_POC_OP_618580_LambdaFullAccess_PolicyARN
  
  HTC_POC_OP_618580_APIPolicyAttachment_Name                 = var.HTC_POC_OP_618580_APIPolicyAttachment_Name
 
  HTC_POC_OP_618580_LambdaDynamoDBPolicyAttachment_Name      = var.HTC_POC_OP_618580_LambdaDynamoDBPolicyAttachment_Name
  HTC_POC_OP_618580_LambdaDynamoDBPolicyAttachment_PolicyARN = var.HTC_POC_OP_618580_LambdaDynamoDBPolicyAttachment_PolicyARN
  
  HTC_POC_OP_618580_CloudWatchPolicyAttachment_Name          = var.HTC_POC_OP_618580_CloudWatchPolicyAttachment_Name


 
  policy_arn_APIGateway = module.policy.policy_arn_APIGateway
  policy_arn_CloudWatch = module.policy.policy_arn_CloudWatch
  policy_arn_API = module.policy.policy_arn_API
  policy_arn_Lambda = module.policy.policy_arn_Lambda
  APIGateway_Role_Name= module.role.APIGateway_Role_Name
  Auth_Role_Name = module.role.Auth_Role_Name
  Lambda_Role_Name = module.role.Lambda_Role_Name


}

module "role" {
  source = "../../../Modules/iam/role"

  HTC_POC_OP_618580_APIGatewayRole_Name                      = var.HTC_POC_OP_618580_APIGatewayRole_Name
  api_gateway_role_policy                                    = var.api_gateway_role_policy
  HTC_POC_OP_618580_LambdaRoleForAuthorizer_Name             = var.HTC_POC_OP_618580_LambdaRoleForAuthorizer_Name
  lambda_role_policy                                         = var.lambda_role_policy
  HTC_POC_OP_618580_LambdaRole_Name                          = var.HTC_POC_OP_618580_LambdaRole_Name
  lambdarole                                                 = var.lambdarole
  common_tags                                                = var.common_tags
}

