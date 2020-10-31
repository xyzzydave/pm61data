#!/bin/bash
aws ec2 create-key-pair --key-name testkey1 --region us-west-2
aws cloudformation create-stack --stack-name s3bucket-codeproject --template-body file://infrastructure/s3.yml --region us-west-2
aws cloudformation wait stack-create-complete --stack-name s3bucket-codeproject  --region us-west-2
aws s3 cp infrastructure s3://pm61data-ddockhorn/pm61data/infrastructure --recursive --region us-west-2
aws cloudformation create-stack --stack-name vpc-codeproject --template-body file://infrastructure/vpc.yml --capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM --region us-west-2