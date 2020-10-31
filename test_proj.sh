#!/bin/bash
# This script will close port 22 on the ec2 test host
export ec2_id=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=pm61data-PrivateHost" --query Reservations[*].Instances[*].{Instance:InstanceId} --output text)

aws ssm send-command \
	--instance-ids $ec2_id \
	--document-name "AWS-RunShellScript" \
	--comment "IP config" \
	--parameters commands="/sbin/iptables -A INPUT -p tcp --destination-port 22 -j DROP && /sbin/service iptables save" \
	--output text