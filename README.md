<h1>pm61data code challenge
<img src="https://upload.wikimedia.org/wikipedia/commons/4/49/Creation_of_man_Prometheus_Berthelemy_Louvre_INV20043.jpg" alt="Lighting the Way" /></h1>
CloudFormation and the aws cli are the tools used to achieve the goals of the project.<br>
This proect will;
<ul>
<li>create an s3 bucket via cloudformation</li>
<li>create a key pair</li> 
<li>upload a few CloudFormation templates to the bucket and then create 3 stacks.</li>
<ul>
<li>A vpc stack.</li>
<li>An ec2 stack.</li>
<li>And finally, a lambda stack.</li>
</ul></ul>
There is also a script to take everything down.<br>
<br>

<h2>Cool features</h2>
<ul>
<li>The ec2 has the ssm agent installed so you can get into it if you need to.</li>
<li>The lambda knows the ip of the ec2 through a cloudformation export.</li>
<li>The code for the lambda is defined inline in the template which is nice for small lambda projects.</li>
<li>There are 2 ways to get an attribute: 1) !Sub ${LambdaSchedule.Arn} 2) !GetAtt LambdaSchedule.Arn I use !Sub in the lambda and GetAtt in the ec2 template just for fun.<br>
<li>It took 6 fairly small files to do all the work.</li>
<li>The project uses nested stacks to allow for the ec2 and lambda to be updated/replaced independently of the vpc.</li>
<li>There is a test!</li>
</ul>
<h2>Getting started using this repo</h2>

<h3>Quickstart</h3>
./create_proj.sh <== run that<br>
<h3>Instructions</h3>
Following are instructions to run an .sh script that will use the aws cli to run the cloudformation templates in this repo to create a vpc, ec2 and a lambda according to the pm61data code challenge specifications.
<h3>Sign up for an aws account</h3>
https://portal.aws.amazon.com/gp/aws/developer/registration/index.html?refid=em_127222

<h3>Navigate to the Cloud9 ide service</h3>
<ul>
<li>Login to the account.</li>
<li>Change the region to us-west-2 or Oregon. Look at the top right.</li>
<li>Go to Cloud9 service.</li>
<li>Bring up the debugger (F6) for Windows users.</li> 
<li>Click the green plus sign and select new terminal.</li>
<li>Do the following in the debugger terminal;</li>
<ul>
  <li>git clone https://github.com/ddtraveller/pm61data.git</li>
  <li>cd pm61data</li>
  <li>./create_proj.sh</li>
</ul></ul>
<h3>Testing</h3>
Run the test script and this will close port 22 on the host. You can then observe the lambda will change it's output to reflect the port status.<br>
It's probably easiest to go to the lambda console and run it to see the output change.
<h2>Code Challenge Requirements</h2>
<h3>VPC</h3>
<ol><li>The VPC should contain 2 subnets, 1 public and 1 private.</li></ol>
<h3>EC2 instance</h3>
Place an EC2 instance in the private subnet with following requirements:
<ol><li>No pu/blic IP/Elastic IP assigned to this instance. No public access. Only
instances/Lambda functions from the same VPC can access this instance.</li>
<li>This instance should be able to make outbound call to access the internet (e.g., pip
install some software)</li>
<li>This instance only allows inbound access from port 22</li></ol>
<h3>Lambda Function</h3>
Write a simple Lambda function with following requirements:
<ol><li>This lambda function needs to be placed in the same subnet as the private instance.</li>
<li>This lambda function checks if port 22 of the instance is up and running. Output the
status of port 22 to a Cloudwatch logstream.</li>
<li>Configure an event rule for this Lambda function to execute every minute.</li></ol></ol>
