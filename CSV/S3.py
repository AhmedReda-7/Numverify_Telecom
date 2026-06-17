import boto3

s3 = boto3.client('s3')
s3.upload_file('usage_billing.csv', 'etl-s3-cus-churn', 'C:/Users/arsaeed/Downloads/Telecom/CSV/usage_billing.csv')