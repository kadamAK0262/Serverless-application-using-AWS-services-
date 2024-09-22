package test
 
import (
    "regexp"
    "testing"
 
    "github.com/gruntwork-io/terratest/modules/terraform"
    "github.com/stretchr/testify/assert"
)
 
func TestInfrastructure(t *testing.T) {
    t.Parallel()
 
    // Terraform Directory Path
    terraformDir := "C:/Users/bhaskar.ganjikunta/Desktop/terraform_codebuild_workingcode - Copy/terraformusecase"
 
    terraformOptions := &terraform.Options{
        TerraformDir: terraformDir,
        Vars:         map[string]interface{}{},
    }
 
    // Run 'terraform init' and 'terraform apply'
    terraform.InitAndApply(t, terraformOptions)
 
    // Defer the destroy to ensure cleanup even if the test fails
    t.Cleanup(func() {
        terraform.Destroy(t, terraformOptions)
    })
 
    // Validate the DynamoDB Table from the module
    validateDynamoDBTable(t, terraformOptions)
    validateLambdaFunction(t, terraformOptions)
    validateSQSQueue(t, terraformOptions)
    validateAPIGateway(t, terraformOptions)
 
}
 
// ***********************
// DYNMODB-MODULE
// ***********************
func validateDynamoDBTable(t *testing.T, terraformOptions *terraform.Options) {
    // Retrieve the DynamoDB Table name from Terraform output in the specified module
    dynamodbTableName := terraform.Output(t, terraformOptions, "Usecase_DynamoDBTable")
 
    // Add assertions for the DynamoDB Table
    assert.NotNil(t, dynamodbTableName, "DynamoDB table name should not be nil")
    assert.Contains(t, dynamodbTableName, "Usecase_DynamoDBTable", "DynamoDB table name should be 'Usecase_DynamoDBTable'")
 
    expectedPrimaryKeyType := "N" // Assuming the expected data type is a number (adjust as needed)
 
    // Validate the assumed primary key attribute and its data type
    primaryKeyAttributeType := terraform.Output(t, terraformOptions, "aws_dynamodb_table_hash_key_type")
    assert.Equal(t, expectedPrimaryKeyType, primaryKeyAttributeType, "DynamoDB Primary Key attribute type should be 'N' (Number)")
 
    dynamoDBHashKey := terraform.Output(t, terraformOptions, "dynamo_db_key")
 
    // Add assertions for the DynamoDB hash key
    assert.NotNil(t, dynamoDBHashKey, "DynamoDB hash key should not be nil")
    assert.Equal(t, "order_id", dynamoDBHashKey, "DynamoDB hash key should be 'order_id'")
 
    // Retrieve the DynamoDB Table billing mode from Terraform output
    dynamoDBBillingMode := terraform.Output(t, terraformOptions, "dynamo_db_billing_mode")
 
    // Add assertions for the DynamoDB billing mode
    assert.NotNil(t, dynamoDBBillingMode, "DynamoDB billing mode should not be nil")
    assert.Equal(t, "PAY_PER_REQUEST", dynamoDBBillingMode, "DynamoDB billing mode should be 'PAY_PER_REQUEST', adjust as needed")
}
 
// // ******************************
// // LAMBDA_MODULE
// // ******************************
func validateLambdaFunction(t *testing.T, terraformOptions *terraform.Options) {
    // Retrieve the Lambda function name and runtime from Terraform output
    lambdaFunctionName := terraform.Output(t, terraformOptions, "crud_lambda_function_name")
    GetlambdaFunctionName := terraform.Output(t, terraformOptions, "get_lambda_function_name")
    lambdaFunctionRuntime := terraform.Output(t, terraformOptions, "lambda_functions_runtime")
 
    // Add assertions for the Lambda function
    assert.NotNil(t, lambdaFunctionName, "Lambda function name should not be nil")
    assert.Equal(t, "Usecase_LambdaFunction_CRUD", lambdaFunctionName, "Lambda function name should be 'Usecase_LambdaFunction_CRUD'")
 
    assert.NotNil(t, GetlambdaFunctionName, "Lambda function name should not be nil")
    assert.Equal(t, "Usecase_LambdaFunction_GET", GetlambdaFunctionName, "Lambda function name should be 'Usecase_LambdaFunction_GET'")
 
    assert.NotNil(t, lambdaFunctionRuntime, "Lambda function runtime should not be nil")
    assert.Equal(t, "python3.8", lambdaFunctionRuntime, "Lambda function runtime should be 'python3.8'")
 
}
 
// // *****************************
// // SQS_MODULE
// // *****************************
func validateSQSQueue(t *testing.T, terraformOptions *terraform.Options) {
    sqsQueueName := terraform.Output(t, terraformOptions, "sqs_queue_name")
    // Retrieve the SQS Queue URL from Terraform output
    sqsQueueURL := terraform.Output(t, terraformOptions, "sqs_queue_url")
    assert.NotNil(t, sqsQueueName, "SQS queue name should not be nil")
    assert.Equal(t, "Usecase_QueueSQS", sqsQueueName, "Queue name should be 'Usecase_QueueSQS'")
 
    // Add assertions for the SQS Queue URL format
    assert.NotNil(t, sqsQueueURL, "SQS Queue URL should not be nil")
    assert.Regexp(t, regexp.MustCompile("^https://sqs\\.ap-southeast-1\\.amazonaws\\.com/your_account_number/Usecase_QueueSQS$"), sqsQueueURL, "SQS Queue URL should match the expected format")
}
 
// // *******************************
// // API_GATEWAY_MODULE
// // *******************************
func validateAPIGateway(t *testing.T, terraformOptions *terraform.Options) {
    // Retrieve the API Gateway URL and tags from Terraform output
    apiGatewayTags := terraform.OutputMap(t, terraformOptions, "common_tags")
    apiGatewayName := terraform.Output(t, terraformOptions, "api_gateway_name")
    apiGatewayARN := terraform.Output(t, terraformOptions, "api_gateway_arn")
 
    // Add assertions for API Gateway name
    assert.NotNil(t, apiGatewayName, "API Gateway Name should not be nil")
    assert.Equal(t, "Usecase_APIGateway", apiGatewayName, "API Gateway Name should match the expected name")
 
    // Add assertions for API Gateway ARN
    assert.NotNil(t, apiGatewayARN, "API Gateway ARN should not be nil")
 
    // Example: Validate the format of API Gateway ARN
    assert.Regexp(t, regexp.MustCompile("^arn:aws:execute-api:.*$"), apiGatewayARN, "API Gateway ARN should match the expected format")
 
    // Add assertions for API Gateway tags
    assert.NotNil(t, apiGatewayTags, "API Gateway tags should not be nil")
    assert.Equal(t, "Usecase_APIGateway", apiGatewayTags["Name"], "Name tag should be 'Usecase_APIGateway'")
    assert.Equal(t, "Akshay", apiGatewayTags["Owner"], "Owner tag should be 'DINESH'")
    assert.Equal(t, "ORDERPROCESSING", apiGatewayTags["Project"], "Project tag should be 'ORDERPROCESSING'")
    // Add more assertions as needed based on your specific API Gateway configuration
}
 