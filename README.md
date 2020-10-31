# pm61data code challenge
This project will create a vpc, an ec2 and a lambda that checks port 22 on the ec2 instance continually.

To create everything run the create_proj.sh.
This will create an s3 bucket and a key pair, upload a few CloudFormation templates to the bucket and then create 3 stacks.
A vpc stack.
An ec2 stack.
And finally, a lambda stack.

There is also a script to take everything down.

Some of the cool features of this project are; 
  the ec2 has the ssm agent installed so you can get into it if you need to.
  the lambda knows the ip of the ec2 through a cloudformation export.
  the code for the lambda is defined inline in the template which is nice for small lambda projects. 
  there are 2 ways to get an attribute: 1) !Sub ${LambdaSchedule.Arn} 2) !GetAtt LambdaSchedule.Arn I use !Sub in the lambda and GetAtt in the ec2 template just for fun.
  it took 6 fairly small files to do all the work.
  the project uses nested stacks to allow for the ec2 and lambda to be updated/replaced independently of the vpc.  
