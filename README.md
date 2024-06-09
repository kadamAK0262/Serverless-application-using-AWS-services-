# Serverless-application-using-AWS-services-

AWS services, orchestrated with Terraform. The application leverages AWS Lambda, API Gateway, DynamoDB and SQS to provide a scalable and reliable solution.

Architecture :
The application architecture is designed to be fully serverless, ensuring high availability, automatic scaling, and reduced operational overhead. Below is a high-level overview of the components:

API Gateway: Serves as the entry point for HTTP requests to the application.
Lambda Functions: Handle the business logic triggered by API Gateway, DynamoDB Streams, SQS, and SNS.
DynamoDB: NoSQL database used for persistent storage.
SQS (Simple Queue Service): Ensures reliable delivery of messages between services.

Features :
Scalability: Automatically scales with traffic and load.
Cost-Effective: Pay only for what you use with serverless infrastructure.
High Availability: Leveraging AWS's global infrastructure for high availability.
Event-Driven: Efficient and decoupled components using events.

Prerequisites :
Before you begin, ensure you have met the following requirements:

AWS Account
Terraform installed on your local machine
AWS CLI configured with necessary permissions.

Usage :
Once the infrastructure is deployed, you can start using the application:

API Gateway: Access the API endpoints via the URL provided by API Gateway.
DynamoDB: Data is stored and retrieved from DynamoDB tables.
Lambda: Business logic executed in response to API calls, DynamoDB streams, SQS messages, and SNS notifications.
SQS : Manage queues and topics as configured in the Terraform scripts.
