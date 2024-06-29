# API_GATEWAY Attached policy

resource "aws_iam_policy_attachment" "Usecase_APIGatewayPolicyAttachment" {
  name       = var.Usecase_APIGatewayPolicyAttachment_Name
  policy_arn = var.policy_arn_APIGateway
  roles      = [var.APIGateway_Role_Name]
}

# Lambda Auth

resource "aws_iam_policy_attachment" "Usecase_APIPolicyAttachment" {
  name       = var.Usecase_APIPolicyAttachment_Name
  policy_arn = var.policy_arn_API
  roles      = [var.Auth_Role_Name]

}


resource "aws_iam_policy_attachment" "Usecase_LambdaFullAccess" {
  name       = var.Usecase_LambdaFullAccess_Name
  policy_arn = var.Usecase_LambdaFullAccess_PolicyARN
  roles      = [var.Auth_Role_Name]
}


# lambda 

resource "aws_iam_policy_attachment" "Usecase_LambdaDynamoDBPolicyAttachment" {
  name       = var.Usecase_LambdaDynamoDBPolicyAttachment_Name
  policy_arn = var.Usecase_LambdaDynamoDBPolicyAttachment_PolicyARN
  roles      = [var.Lambda_Role_Name]
}

resource "aws_iam_role_policy_attachment" "Usecase_LambdaRolePolicyAttachment" {
  policy_arn = var.policy_arn_Lambda
  role       = var.Lambda_Role_Name
}

resource "aws_iam_policy_attachment" "Usecase_CloudWatchPolicyAttachment" {
  name       = var.Usecase_CloudWatchPolicyAttachment_Name
  policy_arn = var.policy_arn_CloudWatch
  roles      = [var.Lambda_Role_Name]
}
