https://docs.aws.amazon.com/cli/v1/userguide/cli-services-ec2-instances.html

** Launch your instance

aws ec2 run-instances --image-id ami-0c76bd4bd302b30ec --count 1 --instance-type t2.micro --key-name collins-key --security-group-ids sg-903004f8 --subnet-id subnet-6e7f829e

** Add a block device to your instance:

--block-device-mappings "[{\"DeviceName\":\"/dev/sdf\",\"Ebs\":{\"VolumeSize\":20,\"DeleteOnTermination\":false}}]"


** Add a tag to your instance:

aws ec2 create-tags --resources i-5203422c --tags Key=Name,Value=MyInstance

** List your instances:

aws ec2 describe-instances

aws ec2 describe-instances --filters "Name=instance-type,Values=t2.micro" --query "Reservations[].Instances[].InstanceId"

aws ec2 describe-instances --filters "Name=tag:Name,Values=MyInstance"

aws ec2 describe-instances --filters "Name=image-id,Values=ami-x0123456,ami-y0123456,ami-z0123456"

** Delete your instance:

aws ec2 terminate-instances --instance-ids i-5203422c
