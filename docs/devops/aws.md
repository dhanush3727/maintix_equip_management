# AWS (Amazon Web Services)
## Overview
AWS is a cloud platform that provides infrastructure and services over the internet. Instead of buying and maintaining physical servers yourself, you can rent computing resources from AWS.

## EC2 - Elastic Compute Cloud
### Overview
EC2 is an AWS service that provides virtual servers.
An EC2 instance is a virtual computer provided by AWS. It has resources similar to a physical computer:
* CPU
* RAM
* Storage
* Operating System
* Network

### AMI - Amazon Machine Image
When creating an EC2 instance, you'll choose an AMI.
An AMI is a template used to create an EC2 instance. It contains the information needed to launch the operating system and its configuration.
```text
AMI          → Blueprint
EC2 Instance → Machine created from that blueprint
```

### Instance Type
The instance type determines the compute resources available to the EC2 instance, such as CPU, memory, and networking capacity.

### Storage
An EC2 instance needs disk storage. AWS commonly provides persistent storage using **EBS (Elastic Block Store)**.

### Public IP
An EC2 instance can have a public IP address.
The public IP allows your computer and other internet clients to communicate with the EC2 server.
Later, when Nginx and a domain are configured, the domain can be used instead of directly accessing the IP address.
> A normal public IPv4 address can change when an EC2 instance is stopped and started.

### SSH - Secure Shell
SSH allows us to remotely access the Linux EC2 server.
After connecting through SSH, we get a Linux shell where we can run commands and manage the server.

### Key Pair
An EC2 key pair consists of:
* **Public key** → stored on the EC2 instance
* **Private key** → kept securely on our computer
The private key is used to authenticate our SSH connection to the EC2 instance.

### Security Group
A Security Group acts as a virtual firewall for the EC2 instance.
It controls which network traffic is allowed to reach the instance.
For our Maintix server, we configured:
```text
SSH  → TCP 22
HTTP → TCP 80
```

## AWS EC2 to SSH Connection
We connect from our Windows computer to the Ubuntu EC2 server using SSH with the private key.

### EC2 Instance Created
For Maintix, we created an EC2 instance called `Maintix`.
EC2 provides the virtual Linux server where we will deploy the Maintix application.

### EC2 Key Pair
During instance creation, we created a key pair named:
```text
maintix-key.pem
```
The `.pem` file contains our private SSH key.
AWS stores the corresponding public key on the EC2 instance.
The private key must remain secure because anyone who obtains it may be able to authenticate to the instance.

### Security Group Configuration
During EC2 creation, we enabled:
```text
SSH  → TCP 22
HTTP → TCP 80
```
These rules allow us to connect to the server through SSH and later access the web application through HTTP.

### Launch the EC2 Instance
After clicking **Launch Instance**, AWS created the virtual machine.
The instance received:
* Public IPv4 address
* Public DNS name
* Private IP address
The public address allows our computer to reach the EC2 instance over the internet.

### AWS SSH Command
AWS provides an SSH command similar to:
```bash
ssh -i "maintix-key.pem" ubuntu@ec2-13-126-76-119.ap-south-1.compute.amazonaws.com
```
This command contains several parts:
* `ssh` → starts an SSH connection.
* `-i "maintix-key.pem"` → specifies the private key used for authentication.
* `ubuntu@` → specifies the Linux username. The Ubuntu AMI provides the `ubuntu` user.
* `ec2-13-126-76-119.ap-south-1.compute.amazonaws.com` → the public DNS name of the EC2 instance.

### Connect from Windows
Open PowerShell in the directory containing the private key and run:
```bash
ssh -i "maintix-key.pem" ubuntu@ec2-13-126-76-119.ap-south-1.compute.amazonaws.com
```
If Windows reports that the private key has insecure permissions, SSH may reject the key.
First check the Windows username:
```powershell
whoami
```
Remove inherited permissions:
```powershell
icacls "maintix-key.pem" /inheritance:r
```
Grant the current Windows user read permission:
```powershell
icacls "maintix-key.pem" /grant:r "(windows-username):R"
```
Check the permissions:
```powershell
icacls "maintix-key.pem"
```
Then run the SSH command again.
After successful authentication, we enter the Ubuntu EC2 server.

## Install Docker
Before installing Docker, understand some of the commands used during the installation.
* `sudo` → runs a command with administrator/root privileges.
* `apt` → Ubuntu's package manager used to install, update, and remove packages.
* `curl` → command-line tool used to transfer data from URLs.

### Prerequisites
#### 1. Update Ubuntu Package Information
```bash
sudo apt update
```
Updates Ubuntu's package index so it knows about the latest available packages.

#### 2. Install Required Packages
```bash
sudo apt install ca-certificates curl
```
Installs packages required to securely access Docker's HTTPS repository.

#### 3. Create Docker Keyrings Directory
```bash
sudo install -m 0755 -d /etc/apt/keyrings
```
Creates the directory used to store repository signing keys.

#### 4. Download Docker's Signing Key
```bash
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
```
Downloads Docker's official GPG signing key.

#### 5. Set Key Permissions
```bash
sudo chmod a+r /etc/apt/keyrings/docker.asc
```
Makes the signing key readable by the APT package manager.

#### 6. Add Docker's Official Repository
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
Adds Docker's official APT repository and configures it to use Docker's signing key.

#### 7. Update Package Information
```bash
sudo apt update
```
Updates the package index again, now including Docker's official repository.

#### 8. Install Docker
```bash
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```
* `docker-ce` → Docker Engine
* `docker-ce-cli` → Docker command-line interface
* `containerd.io` → container runtime
* `docker-buildx-plugin` → Docker Buildx
* `docker-compose-plugin` → Docker Compose

#### 9. Verify Docker Service
```bash
sudo systemctl status docker
```
Checks whether the Docker service is running.

#### 10. Verify Docker and Docker Compose
```bash
sudo docker --version
sudo docker compose version
```
Displays the installed Docker Engine and Docker Compose versions.

#### 11. Test Docker
```bash
sudo docker run hello-world
```
Downloads and runs the `hello-world` image to verify that Docker can pull images and create and run containers successfully.

## Install Git and Clone the Project
We need Git on the EC2 server so we can download the Maintix project from GitHub.
Install Git:
```bash
sudo apt install git
```
Verify the installation:
```bash
git --version
```
Clone the project:
```bash
git clone <project-repo>
```
Move into the project directory:
```bash
cd <project-directory>
```

## Install PostgreSQL
We install PostgreSQL directly on the EC2 server.
Install PostgreSQL:
```bash
sudo apt install postgresql postgresql-contrib
```
Check the PostgreSQL version:
```bash
psql --version
```
Check the PostgreSQL service:
```bash
sudo systemctl status postgresql
```
Check the PostgreSQL cluster:
```bash
sudo pg_lsclusters
```
Open the PostgreSQL shell:
```bash
sudo -u postgres psql
```
Create the Maintix database user:
```sql
CREATE USER maintix_user WITH PASSWORD 'Enter_Password';
```
> PostgreSQL string values should use single quotes, not double quotes.

### Configure PostgreSQL for Docker
Our PostgreSQL server runs directly on the EC2 host, while the Maintix server runs inside Docker.
Therefore, the Docker container needs to connect to PostgreSQL through the EC2 host.
Check the PostgreSQL configuration file:
```bash
sudo -u postgres psql -c "SHOW config_file;"
```
Open the configuration file:
```bash
sudo nano /etc/postgresql/18/main/postgresql.conf
```
Change:
```text
listen_addresses = 'localhost'
```
to:
```text
listen_addresses = '*'
```
This allows PostgreSQL to listen for TCP connections beyond localhost.
Check the location of `pg_hba.conf`:
```bash
sudo -u postgres psql -c "SHOW hba_file;"
```
Open the `pg_hba.conf` file.
For our Maintix Docker network, add:
```text
host    maintix    maintix_user    172.18.0.0/16    scram-sha-256
```
This allows the `maintix_user` to connect to the `maintix` database from containers in the Maintix Docker network using password authentication.

> **Important:** The `host ...` line belongs in `pg_hba.conf`, not `postgresql.conf`.
After changing PostgreSQL configuration, restart PostgreSQL:
```bash
sudo systemctl restart postgresql
```

## Server Environment Variables
The Maintix server requires environment variables for:
* PostgreSQL connection
* JWT authentication
* Cloudinary
* Email
* Client URL
These variables are stored in:
```text
server/.env
```

## Run docker compose
`docker compose build`
`docker compose up`
`docker compose logs`

`sudo docker compose run --rm server npx prisma migrate status`

`sudo docker compose run --rm server npx prisma migrate deploy`

`sudo docker compose run --rm server sh -c 'ls -la prisma.config.ts'`

`sudo docker build --target builder -t maintix-server-seed ./server`