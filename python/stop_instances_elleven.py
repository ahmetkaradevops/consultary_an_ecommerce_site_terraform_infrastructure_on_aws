#import os, boto3
#region = os.environ['AWS_REGION']
#instances = os.environ['instance_id']
#ec2 = boto3.client('ec2', region_name=region)
#def lambda_handler(event, context):
	# Filters
#  filters = [{
#      'Name': 'tag:Name',
#      'Values': ['Elleven']
#    },
#    {
#      'Name': 'instance-state-name', 
#      'Values': ['stopped']
#    }
#  ]
#    ec2.instances.filter(Filters=[{'Name': 'instance-id', 'Values': instance_ids}]).stop()
#    print('started your instances: ' + str(instances))
import boto3

# Boto Connection
ec2 = boto3.resource('ec2', 'eu-west-2')

def lambda_handler(event, context):
  # Filters
  filters = [{
      'Name': 'tag:Name',
      'Values': ['Elleven']
    },
    {
      'Name': 'instance-state-name', 
      'Values': ['running']
    }
  ]

  # Filter running instances that should stop
  instances = ec2.instances.filter(Filters=filters)

  # Retrieve instance IDs
  instance_ids = [instance.id for instance in instances]

  # starting instances
  stopping_instances = ec2.instances.filter(Filters=[{'Name': 'instance-id', 'Values': instance_ids}]).stop()
  print(stopping_instances)
