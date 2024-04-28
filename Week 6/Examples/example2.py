import boto3
def lambda_handler(event, context):
    s3_client = boto3.client('s3')
    
    # List all S3 buckets
    response = s3_client.list_buckets()
    
    # Extract the bucket names from the response
    bucket_names = [bucket['Name'] for bucket in response['Buckets']]
    
    return bucket_names