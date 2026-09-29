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

We created and launched the EC2 instance now we connect the EC2 instance to our computer using the SSH with private key.

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

### Run the EC2 instance in the window
In the windows open the powershell where our security key there, then run the command
```bash
ssh -i "maintix-key.pem" ubuntu@ec2-13-126-76-119.ap-south-1.compute.amazonaws.com
```
- After run this command it show the error. Because windows was allowing more users/groups to access the security key SSH consider that unsafe. The private key is supposed to be private.
- So check the windows username using `whoami` command.
- Then run the command `icacls "maintix-key.pem" /inheritance:r` it is remove the inherited permmissons. Windows can inherit permissions from the parent folder. We didn't want the `.pem` file inheriting broad permissions. So we removed inherited permissions.
- Then run the command `icacls "maintix-key.pem" /grant:r "(windows-username):R"`. It gives the read permission to the private key.
- Then check `icals "maintix-key.pem"` we can get the user name of the window.
- Run again the SSH, this time SSH accepted the private key, successfully entered ubuntu
Now the EC2 instance connected to our windows

## Install Docker
before install docker will see some ubuntu commands and flags to going to use
- `sudo`: It means run this command with administrator(root) privileges.
- `apt`: stands for Advanced Package Tool. It is Ubuntu's package manager. It is allows ubuntu to search, download, install update, remove software.
- `curl`: Is a command line tool used to send requests to URLs and transfer data.

### Prerequities
Now we want to check some prerequisites:
1. Update Ubuntu's package information
```bash
sudo apt update
```
- Updates Ubuntu's package index so it knows about the latest available packages.

2. Installed required packages
```bash
sudo apt install ca-certificates curl
```
- Installs packages required to securely download Docker's repository key and communicate with HTTPS repositories.

3. Create Docker Keyrings Directory
```bash
sudo install -m 0755 -d /etc/apt/keyrings
```
- Creates the directory used to store repository signing keys.

4. Download Docker's Signing Key
```bash
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
```
- Downloads Docker's official GPG signing key and saves it as docker.asc.

5. Set Key Permissions
```bash
sudo chmod a+r /etc/apt/keyrings/docker.asc
```
- Makes the Docker signing key readable by the APT package manager.

6. Add Docker's Official Repository
```bash
sudo tee /etc/apt/sources.list.d/docker.sources > /dev/null <<EOF
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: $(. /etc/os-release && echo "$VERSION_CODENAME")
Components: stable
Architectures: $(dpkg --print-architecture)
Signed-By: /etc/apt/keyrings/docker.asc
EOF
```
- Adds Docker's official APT repository to Ubuntu and configures it to verify packages using Docker's signing key.

7. Update Package Information
```bash
sudo apt update
```
- Updates the package index again, now including Docker's official repository.

8. Install Docker
```bash
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```
- `docker-ce`: Docker Engine
- `docker-ce-cli`: Docker command-line interface
- `containerd.io`: Container runtime
- `docker-buildx-plugin`: Docker Buildx
- `docker-compose-plugin`: Docker Compose

9. Verify Docker Service
```bash
sudo systemctl status docker
```
- Checks whether the Docker service is running.

10. Verify Docker and Docker compose Version
```bash
sudo docker --version
sudo docker compose version
```
- Displays the installed Docker Engine version.
- Displays the installed Docker Compose version.

11. Test Docker
```bash
sudo docker run hello-world
```
- Downloads and runs the `hello-world` image to verify that Docker can pull images and create and run containers successfully.

## Install git and clone the project
We want to deploy our project in EC2 then install the git on the EC2 server.
`sudo apt install git`
`git --version`
`git clone <project-repo>`
`cd <project-directory>`

## Install PostgreSQL
`sudo apt install postgresql postgresql-contrib`
`psql --version`
`sudo systemctl status postgresql`
`sudo pg_lsclusters`
`sudo -u postgres psql`
inside the postgresql
`CREATE USER maintix_user WITH PASSWORD "Enter_Password";`
