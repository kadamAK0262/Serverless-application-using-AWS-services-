
import os
import json
def lambda_handler(event, context):
    print('********* event is - *********')
    print(event)

    auth = 'Allow'
    if event['authorizationToken'] == '618580':
        auth = 'Allow'
    else:
        auth = 'Deny'

    authResponse = {
        "principalId": "abc123",
        "policyDocument": {
            "Version": "2012-10-17",
            "Statement": [
                {
                    "Action": "execute-api:Invoke",
                    "Resource": [
                        "arn:aws:execute-api:us-east-2:your_aws_account_no:*/*/*",
                        "arn:aws:execute-api:us-west-2:your_aws_account_no:*/*/*"
                    ],
                    "Effect": auth
                }
            ]
        }
    }

    return authResponse
