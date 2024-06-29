module "policy" {
  source = "../../../Modules/iam/policy"

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

}

module "attach_policy" {
  source = "../../../Modules/iam/attach_policy"

  Usecase_APIGatewayPolicyAttachment_Name = var.Usecase_APIGatewayPolicyAttachment_Name

  Usecase_LambdaFullAccess_Name      = var.Usecase_LambdaFullAccess_Name
  Usecase_LambdaFullAccess_PolicyARN = var.Usecase_LambdaFullAccess_PolicyARN

  Usecase_APIPolicyAttachment_Name = var.Usecase_APIPolicyAttachment_Name

  Usecase_LambdaDynamoDBPolicyAttachment_Name      = var.Usecase_LambdaDynamoDBPolicyAttachment_Name
  Usecase_LambdaDynamoDBPolicyAttachment_PolicyARN = var.Usecase_LambdaDynamoDBPolicyAttachment_PolicyARN

  Usecase_CloudWatchPolicyAttachment_Name = var.Usecase_CloudWatchPolicyAttachment_Name



  policy_arn_APIGateway = module.policy.policy_arn_APIGateway
  policy_arn_CloudWatch = module.policy.policy_arn_CloudWatch
  policy_arn_API        = module.policy.policy_arn_API
  policy_arn_Lambda     = module.policy.policy_arn_Lambda
  APIGateway_Role_Name  = module.role.APIGateway_Role_Name
  Auth_Role_Name        = module.role.Auth_Role_Name
  Lambda_Role_Name      = module.role.Lambda_Role_Name


}

module "role" {
  source = "../../../Modules/iam/role"

  Usecase_APIGatewayRole_Name          = var.Usecase_APIGatewayRole_Name
  api_gateway_role_policy              = var.api_gateway_role_policy
  Usecase_LambdaRoleForAuthorizer_Name = var.Usecase_LambdaRoleForAuthorizer_Name
  lambda_role_policy                   = var.lambda_role_policy
  Usecase_LambdaRole_Name              = var.Usecase_LambdaRole_Name
  lambdarole                           = var.lambdarole
  common_tags                          = var.common_tags
}

