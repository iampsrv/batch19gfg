import boto3

def lambda_handler(event, context):
    instance_ids = event['instance_ids']
    desired_state = event['desired_state']
    
    ec2_client = boto3.client('ec2')
    
    if desired_state == 'start':
        response = ec2_client.start_instances(InstanceIds=instance_ids)
    elif desired_state == 'stop':
        response = ec2_client.stop_instances(InstanceIds=instance_ids)
    else:
        return 'Invalid desired_state value. Valid values are "start" or "stop".'
    
    return response
