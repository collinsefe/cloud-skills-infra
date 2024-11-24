https://docs.aws.amazon.com/cli/v1/userguide/cli-services-ec2-sg.html

** Create a security group
aws ec2 create-security-group --group-name my-sg --description "My security group" --vpc-id vpc-1a2b3c4d


aws ec2 describe-security-groups --group-ids sg-903004f8

** Add rules to your security group