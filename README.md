# pm61data code challenge
![Lighting the Way in the Darkness](https://www.deviantart.com/zott0123/art/Prometheus-Fire-500535834 =955x705)
## This project will
This project will create a vpc, an ec2 and a lambda that checks port 22 on the ec2 instance continually.
<br>
To create everything run the create_proj.sh.<br>
This will create an s3 bucket and a key pair, upload a few CloudFormation templates to the bucket and then create 3 stacks.<br>
A vpc stack.<br>
An ec2 stack.<br>
And finally, a lambda stack.<br>
<br>
There is also a script to take everything down.<br>
<br>
## Cool features
Some of the cool features of this project are; <br>
&nbsp;&nbsp;&nbsp;&nbsp;the ec2 has the ssm agent installed so you can get into it if you need to.<br>
&nbsp;&nbsp;&nbsp;&nbsp;the lambda knows the ip of the ec2 through a cloudformation export.<br>
&nbsp;&nbsp;&nbsp;&nbsp;the code for the lambda is defined inline in the template which is nice for small lambda projects. <br>
&nbsp;&nbsp;&nbsp;&nbsp;there are 2 ways to get an attribute: 1) !Sub ${LambdaSchedule.Arn} 2) !GetAtt LambdaSchedule.Arn I use !Sub in the lambda and GetAtt in the ec2 template just for fun.<br>
&nbsp;&nbsp;&nbsp;&nbsp;it took 6 fairly small files to do all the work.<br>
&nbsp;&nbsp;&nbsp;&nbsp;the project uses nested stacks to allow for the ec2 and lambda to be updated/replaced independently of the vpc.  
## Getting started using this repo
### Quickstart
./create_proj.sh <== run that<br>
### Instructions
Following are instructions to run an .sh script that will use the aws cli to run the cloudformation templates in this repo to create a vpc, ec2 and a lambda according to the pm61data code challenge specifications.
### Sign up for an aws account
https://portal.aws.amazon.com/gp/aws/developer/registration/index.html?refid=em_127222
### Navigate to the Cloud9 ide service
* Login to the account.
* Change the region to us-west-2 or Oregon. Look at the top right.
* Go to Cloud9 service.
* Bring up the debugger (F6) for Windows users. 
* Click the green plus sign and select new terminal.
* Do the following in the debugger terminal
  * git clone https://github.com/ddtraveller/pm61data.git
  * cd pm61data
  * ./create_proj.sh
### Code Challenge Requirements
#### VPC
1. The VPC should contain 2 subnets, 1 public and 1 private.
#### EC2 instance
Place an EC2 instance in the private subnet with following requirements:
1. No pu/blic IP/Elastic IP assigned to this instance. No public access. Only
instances/Lambda functions from the same VPC can access this instance.
2. This instance should be able to make outbound call to access the internet (e.g., pip
install some software)
3. This instance only allows inbound access from port 22
#### Lambda Function
Write a simple Lambda function with following requirements:
1. This lambda function needs to be placed in the same subnet as the private instance.
2. This lambda function checks if port 22 of the instance is up and running. Output the
status of port 22 to a Cloudwatch logstream.
3. Configure an event rule for this Lambda function to execute every minute.

