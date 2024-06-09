# API_GATEWAY Attached policy

resource "aws_iam_policy_attachment" "HTC_POC_OP_618580_APIGatewayPolicyAttachment" {
  name       = var.HTC_POC_OP_618580_APIGatewayPolicyAttachment_Name
  policy_arn = var.policy_arn_APIGateway
  roles      = [var.APIGateway_Role_Name]
}

# Lambda Auth

resource "aws_iam_policy_attachment" "HTC_POC_OP_618580_APIPolicyAttachment" {
  name       = var.HTC_POC_OP_618580_APIPolicyAttachment_Name
  policy_arn = var.policy_arn_API
  roles      = [var.Auth_Role_Name]

}


resource "aws_iam_policy_attachment" "HTC_POC_OP_618580_LambdaFullAccess" {
  name       = var.HTC_POC_OP_618580_LambdaFullAccess_Name
  policy_arn = var.HTC_POC_OP_618580_LambdaFullAccess_PolicyARN
  roles      = [var.Auth_Role_Name]
}


# lambda 

resource "aws_iam_policy_attachment" "HTC_POC_OP_618580_LambdaDynamoDBPolicyAttachment" {
  name       = var.HTC_POC_OP_618580_LambdaDynamoDBPolicyAttachment_Name
  policy_arn = var.HTC_POC_OP_618580_LambdaDynamoDBPolicyAttachment_PolicyARN
  roles      = [var.Lambda_Role_Name]
}

resource "aws_iam_role_policy_attachment" "HTC_POC_OP_618580_LambdaRolePolicyAttachment" {
  policy_arn = var.policy_arn_Lambda
  role       = var.Lambda_Role_Name
}

resource "aws_iam_policy_attachment" "HTC_POC_OP_618580_CloudWatchPolicyAttachment" {
  name       = var.HTC_POC_OP_618580_CloudWatchPolicyAttachment_Name
  policy_arn = var.policy_arn_CloudWatch
  roles      = [var.Lambda_Role_Name]
}
