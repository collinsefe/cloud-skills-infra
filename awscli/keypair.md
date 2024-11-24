https://docs.aws.amazon.com/cli/v1/userguide/cli-services-ec2-keypairs.html

Create a key pair
aws ec2 create-key-pair --key-name MyKeyPair --query 'KeyMaterial' --output text > MyKeyPair.pem

chmod 400 MyKeyPair.pem