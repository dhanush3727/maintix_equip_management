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

## AWS EC2 to SSH Connection
Connect from windows laptop to the Ubuntu EC2 server running in AWS so we can later install Docker and deploy Maintix.

### EC2 instance created
For this project created an EC2 instance called `Maintix`. EC2 gives us a virtual linux server in AWS.

### EC2 Key Pair
During instance creation, the key pair also created with name of `maintix-key.pem`. The `.pem` file is the private SSH key. The key is allows your computer to connect the EC2 instance. AWS keeps the corresponding public key on the EC2 instance. The private key stays on the computer.

### Configured the Security Group
During the EC2 creation, enable the `SSH` & `HTTP`. We didn't manually type the port numbers. AWS automatically created rules such as:
```text
SSH - TCP 22
HTTP - TCP 80
```

### Launce the EC2 instance
After clicking Launch instance, AWS created the actual virtual machine. It received a public address and a public DNS name. The public address allows your computer on the internet to reach the EC2 instance.

### AWS SSH Tab
AWS provide this command
```bash
ssh -i "maintix-key.pem" ubuntu@ec2-13-126-76-119.ap-south-1.compute.amazonaws.com
```
This command contains several important pieces,
- `ssh`: Use the Secure Shell Protocol to connect to another computer.
- `-i "maintix-key.pem"`: Use this private key for authentication.
- `ubuntu@`: This is the linux username we're logging in as. The Ubuntu EC2 AMI provides the `ubuntu` user. So we're saying login as ubuntu
- `ec2-13-126-76-119.ap-south-1.compute.amazonaws.com`: This identifies the EC2 server wwe're connecting to.