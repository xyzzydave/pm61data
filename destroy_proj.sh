#!/bin/bash
aws ec2 delete-key-pair --key-name testkey1 --region us-west-2
aws s3 rb --force s3://pm61data-ddockhorn
aws cloudformation delete-stack --stack-name s3bucket-codeproject --region us-west-2
aws cloudformation delete-stack --stack-name vpc-codeproject --region us-west-2