# AWS (Amazon Web Service):
## Overview:
AWS is a cloud platform that provides infrastructure and services over the internet. Instead of buying and maintaining physical servers yourself, you can rent computing resources from AWS.

## EC2 - Elastic Compute Cloud
### Overview:
EC2 is an AWS service that provides virtual servers. That is A computer/server that AWS gives you to run your application. In AWS when we create EC2 it is an instance. An EC2 instance gives you resources similar to a physical computer: *CPU, RAM, Storage, Operating System, Network*

### AMI - Amazon Machine Image
When creating an EC2 instance, you'll be asked to choose an AMI. An AMI is basically a template used to create your EC2 instance. That means
AMI - Blueprint
EC2 Instance - Machine created from that blueprint

### Instance type
You'll also choose an instance type. This determines the compute resources of your EC2 server.

### Storage
An EC2 instance needs disk storage. AWS commonly provides this through *EBS (Elastic Block Store)*

### Public IP
You EC2 instance can have a public ip address. Then you can connect to the server from your computer. Later when nginx is configured, we'll replace the raw IP with a domain name.

### SSH - Secure Shell
SSH lets you remotely access your EC2 linux server. Once connected, you'll see a linux shell.

### Key pair
When creating an EC2 instance, AWS can create a *key pair* for SSH authentication. You typically get a private key file. The private key proves that you are authorized to connect.

### Security Group
This is one of the most important EC2 concepts. A *Security Group* acts like a virtual firewall for your instance.