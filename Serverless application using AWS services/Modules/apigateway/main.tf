
# LAMBDA_AUTHORIZER CREATION

resource "aws_api_gateway_authorizer" "Usecase_LambdaTokenAuthorizer" {
  name                   = var.Usecase_LambdaTokenAuthorizer_Name
  rest_api_id            = aws_api_gateway_rest_api.Usecase_APIGateway.id
  type                   = var.Usecase_LambdaTokenAuthorizer_Type
  authorizer_uri         = var.Usecase_LambdaTokenAuthorizer_InvokeARN
  identity_source        = var.Usecase_LambdaTokenAuthorizer_IdentitySource
  authorizer_credentials = var.Usecase_LambdaRoleForAuthorizer_ARN
}

# API_GATEWAY CREATION

resource "aws_api_gateway_rest_api" "Usecase_APIGateway" {
  name        = var.Usecase_APIGateway_Name
  description = var.Usecase_APIGateway_Description
  endpoint_configuration {
    types = [var.Usecase_APIGateway_EndpointType]
  }
  tags = var.common_tags
}

# API_GATEWAY RESOURCE & REQUEST VALIDATOR


resource "aws_api_gateway_resource" "Usecase_APIGateway_Resource" {
  rest_api_id = aws_api_gateway_rest_api.Usecase_APIGateway.id
  parent_id   = aws_api_gateway_rest_api.Usecase_APIGateway.root_resource_id
  path_part   = var.Usecase_APIGateway_Resource_PathPart
}

resource "aws_api_gateway_request_validator" "Usecase_APIGateway_RequestValidator" {
  rest_api_id           = aws_api_gateway_rest_api.Usecase_APIGateway.id
  name                  = var.Usecase_APIGateway_RequestValidator_Name
  validate_request_body = var.Usecase_APIGateway_RequestValidator_ValidateRequestBody
}


# API_GATEWAY POST_METHOD


resource "aws_api_gateway_method" "Usecase_APIGateway_Method_POST" {
  rest_api_id   = aws_api_gateway_rest_api.Usecase_APIGateway.id
  resource_id   = aws_api_gateway_resource.Usecase_APIGateway_Resource.id
  http_method   = var.Usecase_APIGateway_HTTPMETHOD
  authorization = var.Usecase_APIGateway_Method_Authorization
  authorizer_id = aws_api_gateway_authorizer.Usecase_LambdaTokenAuthorizer.id

}


# API_GATEWAY POST_INTEGRATION


data "aws_region" "current" {}

resource "aws_api_gateway_integration" "Usecase_APIGateway_Integration_POST" {
  rest_api_id             = aws_api_gateway_rest_api.Usecase_APIGateway.id
  resource_id             = aws_api_gateway_resource.Usecase_APIGateway_Resource.id
  http_method             = aws_api_gateway_method.Usecase_APIGateway_Method_POST.http_method
  type                    = var.Usecase_APIGateway_Integration_TYPE
  uri                     = "${var.arn_apigateway}${data.aws_region.current.name}${var.Usecase_QueueSQS_path}"
  integration_http_method = var.Usecase_APIGateway_HTTPMETHOD
  credentials             = var.Usecase_APIGatewayRole_ARN
  request_templates = {
    "application/json" = var.Usecase_APIGateway_Integration_RequestTemplates
  }

  request_parameters = {
    "integration.request.header.Content-Type" = var.Usecase_APIGateway_Integration_RequestParameters
  }
}


# API_GATEWAY POST_METHOD_RESPONSE


resource "aws_api_gateway_method_response" "Usecase_APIGateway_MethodResponse_POST" {
  rest_api_id = aws_api_gateway_rest_api.Usecase_APIGateway.id
  resource_id = aws_api_gateway_resource.Usecase_APIGateway_Resource.id
  http_method = aws_api_gateway_method.Usecase_APIGateway_Method_POST.http_method
  status_code = var.Usecase_APIGateway_MethodResponse_StatusCode
}


# API_GATEWAY POST_INTEGRATION_RESPONSE


resource "aws_api_gateway_integration_response" "Usecase_APIGateway_IntegrationResponse_Post" {
  depends_on = [aws_api_gateway_integration.Usecase_APIGateway_Integration_POST]

  rest_api_id = aws_api_gateway_rest_api.Usecase_APIGateway.id
  resource_id = aws_api_gateway_resource.Usecase_APIGateway_Resource.id
  http_method = aws_api_gateway_method.Usecase_APIGateway_Method_POST.http_method
  status_code = var.Usecase_APIGateway_MethodResponse_StatusCode

  response_templates = {
    "application/json" = var.Usecase_APIGateway_IntegrationResponse_Post_ResponseTemplate
  }
}


# API_GATEWAY PUT_METHOD


resource "aws_api_gateway_method" "Usecase_APIGateway_Method_PUT" {
  rest_api_id   = aws_api_gateway_rest_api.Usecase_APIGateway.id
  resource_id   = aws_api_gateway_resource.Usecase_APIGateway_Resource.id
  http_method   = var.Usecase_APIGateway_Method_PUT_HttpMethod
  authorization = var.Usecase_APIGateway_Method_Authorization
  authorizer_id = aws_api_gateway_authorizer.Usecase_LambdaTokenAuthorizer.id
}


# API_GATEWAY PUT_INTEGRATION


resource "aws_api_gateway_integration" "Usecase_APIGateway_Integration_PUT" {
  rest_api_id             = aws_api_gateway_rest_api.Usecase_APIGateway.id
  resource_id             = aws_api_gateway_resource.Usecase_APIGateway_Resource.id
  http_method             = aws_api_gateway_method.Usecase_APIGateway_Method_PUT.http_method
  type                    = var.Usecase_APIGateway_Integration_TYPE
  uri                     = "${var.arn_apigateway}${data.aws_region.current.name}${var.Usecase_QueueSQS_path}"
  integration_http_method = var.Usecase_APIGateway_HTTPMETHOD
  credentials             = var.Usecase_APIGatewayRole_ARN
  request_templates = {
    "application/json" = var.Usecase_APIGateway_Integration_RequestTemplates
  }

  request_parameters = {
    "integration.request.header.Content-Type" = var.Usecase_APIGateway_Integration_RequestParameters
  }
}


# API_GATEWAY PUT_METHOD_RESPONSE


resource "aws_api_gateway_method_response" "Usecase_APIGateway_MethodResponse_PUT" {
  rest_api_id = aws_api_gateway_rest_api.Usecase_APIGateway.id
  resource_id = aws_api_gateway_resource.Usecase_APIGateway_Resource.id
  http_method = aws_api_gateway_method.Usecase_APIGateway_Method_PUT.http_method
  status_code = var.Usecase_APIGateway_MethodResponse_StatusCode
}


# API_GATEWAY PUT_INTEGRATION_RESPONSE


resource "aws_api_gateway_integration_response" "Usecase_APIGateway_IntegrationResponse_PUT" {
  depends_on = [aws_api_gateway_integration.Usecase_APIGateway_Integration_PUT]

  rest_api_id = aws_api_gateway_rest_api.Usecase_APIGateway.id
  resource_id = aws_api_gateway_resource.Usecase_APIGateway_Resource.id
  http_method = aws_api_gateway_method.Usecase_APIGateway_Method_PUT.http_method
  status_code = aws_api_gateway_method_response.Usecase_APIGateway_MethodResponse_PUT.status_code

  response_templates = {
    "application/json" = var.Usecase_APIGateway_IntegrationResponse_PUT_ResponseTemplate
  }
}


# API_GATEWAY DELETE_METHOD


resource "aws_api_gateway_method" "Usecase_APIGateway_Method_DELETE" {
  rest_api_id   = aws_api_gateway_rest_api.Usecase_APIGateway.id
  resource_id   = aws_api_gateway_resource.Usecase_APIGateway_Resource.id
  http_method   = var.Usecase_APIGateway_Method_DELETE_HttpMethod
  authorization = var.Usecase_APIGateway_Method_Authorization
  authorizer_id = aws_api_gateway_authorizer.Usecase_LambdaTokenAuthorizer.id
}


# API_GATEWAY DELETE_INTEGRATION


resource "aws_api_gateway_integration" "Usecase_APIGateway_Integration_DELETE" {
  rest_api_id             = aws_api_gateway_rest_api.Usecase_APIGateway.id
  resource_id             = aws_api_gateway_resource.Usecase_APIGateway_Resource.id
  http_method             = aws_api_gateway_method.Usecase_APIGateway_Method_DELETE.http_method
  type                    = var.Usecase_APIGateway_Integration_TYPE
  uri                     = "${var.arn_apigateway}${data.aws_region.current.name}${var.Usecase_QueueSQS_path}"
  integration_http_method = var.Usecase_APIGateway_HTTPMETHOD
  credentials             = var.Usecase_APIGatewayRole_ARN
  request_templates = {
    "application/json" = var.Usecase_APIGateway_Integration_RequestTemplates
  }

  request_parameters = {
    "integration.request.header.Content-Type" = var.Usecase_APIGateway_Integration_RequestParameters
  }
}


# API_GATEWAY DELETE_METHOD_RESPONSE


resource "aws_api_gateway_method_response" "Usecase_APIGateway_MethodResponse_DELETE" {
  rest_api_id = aws_api_gateway_rest_api.Usecase_APIGateway.id
  resource_id = aws_api_gateway_resource.Usecase_APIGateway_Resource.id
  http_method = aws_api_gateway_method.Usecase_APIGateway_Method_DELETE.http_method
  status_code = var.Usecase_APIGateway_MethodResponse_StatusCode
}


# API_GATEWAY DELETE_INTEGRATION_RESPONSE


resource "aws_api_gateway_integration_response" "Usecase_APIGateway_IntegrationResponse_DELETE" {
  depends_on = [aws_api_gateway_integration.Usecase_APIGateway_Integration_DELETE]

  rest_api_id = aws_api_gateway_rest_api.Usecase_APIGateway.id
  resource_id = aws_api_gateway_resource.Usecase_APIGateway_Resource.id
  http_method = aws_api_gateway_method.Usecase_APIGateway_Method_DELETE.http_method
  status_code = aws_api_gateway_method_response.Usecase_APIGateway_MethodResponse_DELETE.status_code

  response_templates = {
    "application/json" = var.Usecase_APIGateway_MethodResponse_DELETE_ResponseTemplate
  }
}


# API_GATEWAY TO INVOKE GET_LAMBDA_FUNCTION


resource "aws_lambda_permission" "Usecase_APIGateway_Invoke_GET" {
  statement_id  = var.Usecase_APIGateway_Invoke_GET_StatementID
  action        = var.Usecase_APIGateway_Invoke_GET_Action
  function_name = var.Usecase_LambdaFunction_GET_FunctionName
  principal     = var.Usecase_APIGateway_Invoke_GET_Principle
  source_arn    = "arn:aws:execute-api:${data.aws_region.current.name}:${var.aws_account}:${aws_api_gateway_rest_api.Usecase_APIGateway.id}/*/GET/orders"
}


# API_GATEWAY GET_METHOD


resource "aws_api_gateway_method" "Usecase_Method_GET" {
  rest_api_id   = aws_api_gateway_rest_api.Usecase_APIGateway.id
  resource_id   = aws_api_gateway_resource.Usecase_APIGateway_Resource.id
  http_method   = var.Usecase_Method_GET_HttpMethod
  authorization = var.Usecase_APIGateway_Method_Authorization
  authorizer_id = aws_api_gateway_authorizer.Usecase_LambdaTokenAuthorizer.id
}


# API_GATEWAY GET_INTEGRATION


resource "aws_api_gateway_integration" "Usecase_Integration_GET" {
  rest_api_id = aws_api_gateway_rest_api.Usecase_APIGateway.id
  resource_id = aws_api_gateway_resource.Usecase_APIGateway_Resource.id
  http_method = aws_api_gateway_method.Usecase_Method_GET.http_method

  integration_http_method = var.Usecase_APIGateway_HTTPMETHOD
  type                    = var.Usecase_Integration_GET_Type
  uri                     = "arn:aws:apigateway:${data.aws_region.current.name}:lambda:path/2015-03-31/functions/${var.Usecase_LambdaFunction_GET_ARN}/invocations"
  request_templates = {
    "application/json" = var.Usecase_Integration_GET_ApplicationJson
  }
  depends_on = [
    aws_api_gateway_method.Usecase_Method_GET
  ]
}


# API_GATEWAY GET_METHOD_RESPONSE


resource "aws_api_gateway_method_response" "Usecase_MethodResponse_GET" {
  rest_api_id = aws_api_gateway_rest_api.Usecase_APIGateway.id
  resource_id = aws_api_gateway_resource.Usecase_APIGateway_Resource.id
  http_method = aws_api_gateway_method.Usecase_Method_GET.http_method
  status_code = var.Usecase_APIGateway_MethodResponse_StatusCode
  response_models = {
    "application/json" = var.Usecase_MethodResponse_GET_ResponseModels
  }
  depends_on = [
    aws_api_gateway_integration.Usecase_Integration_GET
  ]
}


# API_GATEWAY GET_INTEGRATION_RESPONSE


resource "aws_api_gateway_integration_response" "Usecase_IntegrationResponse_GET" {
  rest_api_id = aws_api_gateway_rest_api.Usecase_APIGateway.id
  resource_id = aws_api_gateway_resource.Usecase_APIGateway_Resource.id
  http_method = var.Usecase_Method_GET_HttpMethod
  status_code = var.Usecase_APIGateway_MethodResponse_StatusCode
  response_templates = {
    "application/json" = var.Usecase_IntegrationResponse_GET_ResponseTemplate
  }
  depends_on = [
    aws_api_gateway_method_response.Usecase_MethodResponse_GET
  ]
}


# API_GATEWAY DEPLOYEMENT


resource "aws_api_gateway_deployment" "Usecase_APIGatewayDeployment" {
  depends_on = [aws_api_gateway_integration.Usecase_APIGateway_Integration_POST,
    aws_api_gateway_integration.Usecase_APIGateway_Integration_PUT,
    aws_api_gateway_integration.Usecase_APIGateway_Integration_DELETE,
    aws_api_gateway_integration.Usecase_Integration_GET
  ]
  rest_api_id = aws_api_gateway_rest_api.Usecase_APIGateway.id
  stage_name  = var.Usecase_APIGatewayDeployment_StageName
}
