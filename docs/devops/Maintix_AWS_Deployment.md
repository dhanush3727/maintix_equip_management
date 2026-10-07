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
AMI  → Blueprint
EC2 Instance → Machine created from that blueprint
```

### Instance Type
The instance type determines the compute resources available to the EC2 instance, such as CPU, memory, and networking capacity.

### Storage
An EC2 instance needs disk storage. AWS commonly provides persistent storage using **\*\*EBS (Elastic Block Store)\*\***.

### Public IP
An EC2 instance can have a public IP address. The public IP allows your computer and other internet clients to communicate with the EC2 server. Later, when Nginx and a domain are configured, the domain can be used instead of directly accessing the IP address. A normal public IPv4 address can change when an EC2 instance is stopped and started.

### SSH - Secure Shell
SSH allows us to remotely access the Linux EC2 server.
After connecting through SSH, we get a Linux shell where we can run commands and manage the server.

### Key Pair
An EC2 key pair consists of:
*Public key* → stored on the EC2 instance
*Private key* → kept securely on our compute
The private key is used to authenticate our SSH connection to the EC2 instance.

### Security Group
A Security Group acts as a virtual firewall for the EC2 instance. It controls which network traffic is allowed to reach the instance. For our Maintix server, we configured:
```text
SSH  → TCP 22
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
The `.pem` file contains our private SSH key. AWS stores the corresponding public key on the EC2 instance. The private key must remain secure because anyone who obtains it may be able to authenticate to the instance.

### Security Group Configuration
During EC2 creation, we enabled:
```text
SSH  → TCP 22
HTTP → TCP 80
```
These rules allow us to connect to the server through SSH and later access the web application through HTTP.

### Launch the EC2 Instance
After clicking *Launch Instance*, AWS created the virtual machine.
The instance received:
* Public IPv4 address
* Public DNS name
* Private IP address
The public address allows our computer to reach the EC2 instance over the internet.

### AWS SSH Command
AWS provides an SSH command similar to:
```bash
ssh -i "maintix-key.pem" ubuntu\@ec2-13-126-76-119.ap-south-1.compute.amazonaws.com
```
This command contains several parts:

* `ssh` → starts an SSH connection.
* `-i "maintix-key.pem"` → specifies the private key used for authentication.
* `ubuntu@` → specifies the Linux username. The Ubuntu AMI provides the \`ubuntu\` user.
* `ec2-13-126-76-119.ap-south-1.compute.amazonaws.com` → the public DNS name of the EC2 instance.

### Connect from Windows
Open PowerShell in the directory containing the private key and run:
```bash
ssh -i "maintix-key.pem" ubuntu\@ec2-13-126-76-119.ap-south-1.compute.amazonaws.com
```
If Windows reports that the private key has insecure permissions, SSH may reject the key.
First check the Windows username:
```powershell
whoami
```
Remove inherited permissions:
```powershell
icacls "maintix-key.pem" /inheritance\:r

\`\`\`

Grant the current Windows user read permission:

\`\`\`powershell

icacls "maintix-key.pem" /grant\:r "(windows-username)\:R"

\`\`\`

Check the permissions:

\`\`\`powershell

icacls "maintix-key.pem"

\`\`\`

Then run the SSH command again.

After successful authentication, we enter the Ubuntu EC2 server.

**## Install Docker**

Before installing Docker, understand some of the commands used during the installation.

\* \`sudo\` → runs a command with administrator/root privileges.

\* \`apt\` → Ubuntu's package manager used to install, update, and remove packages.

\* \`curl\` → command-line tool used to transfer data from URLs.

**### Prerequisites**

**#### 1. Update Ubuntu Package Information**

\`\`\`bash

sudo apt update

\`\`\`

Updates Ubuntu's package index so it knows about the latest available packages.

**#### 2. Install Required Packages**

\`\`\`bash

sudo apt install ca-certificates curl

\`\`\`

Installs packages required to securely access Docker's HTTPS repository.

**#### 3. Create Docker Keyrings Directory**

\`\`\`bash

sudo install -m 0755 -d /etc/apt/keyrings

\`\`\`

Creates the directory used to store repository signing keys.

**#### 4. Download Docker's Signing Key**

\`\`\`bash

sudo curl -fsSL https\://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc

\`\`\`

Downloads Docker's official GPG signing key.

**#### 5. Set Key Permissions**

\`\`\`bash

sudo chmod a+r /etc/apt/keyrings/docker.asc

\`\`\`

Makes the signing key readable by the APT package manager.

**#### 6. Add Docker's Official Repository**

\`\`\`bash

sudo tee /etc/apt/sources.list.d/docker.sources > /dev/null <\<EOF

Types: deb

URIs: https\://download.docker.com/linux/ubuntu

Suites: $(. /etc/os-release && echo "$VERSION_CODENAME")

Components: stable

Architectures: $(dpkg --print-architecture)

Signed-By: /etc/apt/keyrings/docker.asc

EOF

\`\`\`

Adds Docker's official APT repository and configures it to use Docker's signing key.

**#### 7. Update Package Information**

\`\`\`bash

sudo apt update

\`\`\`

Updates the package index again, now including Docker's official repository.

**#### 8. Install Docker**

\`\`\`bash

sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

\`\`\`

\* \`docker-ce\` → Docker Engine

\* \`docker-ce-cli\` → Docker command-line interface

\* \`containerd.io\` → container runtime

\* \`docker-buildx-plugin\` → Docker Buildx

\* \`docker-compose-plugin\` → Docker Compose

**#### 9. Verify Docker Service**

\`\`\`bash

sudo systemctl status docker

\`\`\`

Checks whether the Docker service is running.

**#### 10. Verify Docker and Docker Compose**

\`\`\`bash

sudo docker --version

sudo docker compose version

\`\`\`

Displays the installed Docker Engine and Docker Compose versions.

**#### 11. Test Docker**

\`\`\`bash

sudo docker run hello-world

\`\`\`

Downloads and runs the \`hello-world\` image to verify that Docker can pull images and create and run containers successfully.

**## Install Git and Clone the Project**

We need Git on the EC2 server so we can download the Maintix project from GitHub.

Install Git:

\`\`\`bash

sudo apt install git

\`\`\`

Verify the installation:

\`\`\`bash

git --version

\`\`\`

Clone the project:

\`\`\`bash

git clone \<project-repo>

\`\`\`

Move into the project directory:

\`\`\`bash

cd \<project-directory>

\`\`\`

**## Install PostgreSQL**

We install PostgreSQL directly on the EC2 server.

Install PostgreSQL:

\`\`\`bash

sudo apt install postgresql postgresql-contrib

\`\`\`

Check the PostgreSQL version:

\`\`\`bash

psql --version

\`\`\`

Check the PostgreSQL service:

\`\`\`bash

sudo systemctl status postgresql

\`\`\`

Check the PostgreSQL cluster:

\`\`\`bash

sudo pg_lsclusters

\`\`\`

Open the PostgreSQL shell:

\`\`\`bash

sudo -u postgres psql

\`\`\`

Create the Maintix database user:

\`\`\`sql

CREATE USER maintix_user WITH PASSWORD 'Enter_Password';

\`\`\`

\> PostgreSQL string values should use single quotes, not double quotes.

**### Configure PostgreSQL for Docker**

Our PostgreSQL server runs directly on the EC2 host, while the Maintix server runs inside Docker.

Therefore, the Docker container needs to connect to PostgreSQL through the EC2 host.

Check the PostgreSQL configuration file:

\`\`\`bash

sudo -u postgres psql -c "SHOW config_file;"

\`\`\`

Open the configuration file:

\`\`\`bash

sudo nano /etc/postgresql/18/main/postgresql.conf

\`\`\`

Change:

\`\`\`text

listen_addresses = 'localhost'

\`\`\`

to:

\`\`\`text

listen_addresses = '\*'

\`\`\`

This allows PostgreSQL to listen for TCP connections beyond localhost.

Check the location of \`pg_hba.conf\`:

\`\`\`bash

sudo -u postgres psql -c "SHOW hba_file;"

\`\`\`

Open the \`pg_hba.conf\` file.

For our Maintix Docker network, add:

\`\`\`text

host    maintix    maintix_user    172.18.0.0/16    scram-sha-256

\`\`\`

This allows the \`maintix_user\` to connect to the \`maintix\` database from containers in the Maintix Docker network using password authentication.

\> **\*\*Important:\*\*** The \`host ...\` line belongs in \`pg_hba.conf\`, not \`postgresql.conf\`.

After changing PostgreSQL configuration, restart PostgreSQL:

\`\`\`bash

sudo systemctl restart postgresql

\`\`\`

**## Server Environment Variables**

The Maintix server requires environment variables for:

\* PostgreSQL connection

\* JWT authentication

\* Cloudinary

\* Email

\* Client URL

These variables are stored in:

\`\`\`text

server/.env

\`\`\`

**## Run docker compose**

\`docker compose build\`

\`docker compose up\`

\`docker compose logs\`

\`sudo docker compose run --rm server npx prisma migrate status\`

\`sudo docker compose run --rm server npx prisma migrate deploy\`

\`sudo docker compose run --rm server sh -c 'ls -la prisma.config.ts'\`

\`sudo docker build --target builder -t maintix-server-seed ./server\`
# Maintix AWS Deployment — Complete End-to-End Guide

This section documents the actual deployment of Maintix to AWS EC2, from creating the instance through successful production verification.

## Deployment Architecture

The final deployment uses:

- **AWS EC2** — Ubuntu server hosting Maintix
- **Docker** — runs the Maintix application containers
- **Docker Compose** — manages the application services
- **Nginx** — reverse proxy and public entry point
- **PostgreSQL** — runs directly on the EC2 host
- **Prisma** — database schema and migrations
- **Git** — obtains the Maintix source code from GitHub

The final request flow is:

```text
                         Internet
                            │
                            ▼
                    EC2 Public IP :80
                            │
                            ▼
                    ┌──────────────┐
                    │    Nginx     │
                    │     :80      │
                    └──────┬───────┘
                           │
                  maintix-network
                    ┌──────┴──────┐
                    │             │
                    ▼             ▼
             ┌────────────┐ ┌────────────┐
             │   Client   │ │   Server   │
             │  Next.js   │ │  NestJS    │
             │   :3000    │ │   :5000    │
             └────────────┘ └─────┬──────┘
                                  │
                                  │ TCP :5432
                                  ▼
                           PostgreSQL
                           EC2 Host
```

Nginx is the only application entry point exposed publicly.

```text
/        → client:3000
/api/*  → server:5000
```

PostgreSQL is not exposed through the AWS Security Group. It is accessed internally by the Docker containers through the EC2 host.

---

# 1. Create the EC2 Instance

Create an EC2 instance for Maintix using an Ubuntu AMI.

For this deployment, the EC2 server was upgraded from a `t3.micro` to a `t3.small` because the Next.js Docker build exceeded the memory available on the smaller instance.

The final instance had approximately:

```text
2 GiB RAM
```

The root EBS volume was also increased from:

```text
8 GiB → 16 GiB
```

because Docker images and build layers consume disk space.

## Why the Instance Was Upgraded

The Next.js production build uses a significant amount of memory.

On the smaller instance, the Docker build encountered a Node/V8 heap out-of-memory error.

The practical solution was to increase the EC2 memory rather than trying to force the build to run with insufficient RAM.

---

# 2. Configure Swap

Because the EC2 instance has limited RAM, a 2 GiB swap file was configured.

Swap provides disk-backed virtual memory that the operating system can use when physical RAM becomes constrained.

It is not a replacement for RAM, but it helps prevent memory exhaustion during resource-heavy operations such as Docker builds.

The swap configuration should be verified with:

```bash
free -h
```

and:

```bash
swapon --show
```

---

# 3. Configure the Security Group

The EC2 Security Group acts as the network firewall for the instance.

For the current HTTP deployment, the inbound rules are:

```text
SSH   → TCP 22 → 0.0.0.0/0
HTTP  → TCP 80 → 0.0.0.0/0
```

Port `22` is required for SSH access.

Port `80` is required for browser access to Nginx.

PostgreSQL port `5432` was **not opened publicly**.

This is important because PostgreSQL only needs to be accessible internally from the Docker containers.

---

# 4. Connect to EC2 Through SSH

From Windows PowerShell:

```bash
ssh -i "maintix-key.pem" ubuntu@<public-dns>
```

The Ubuntu EC2 instance uses the `ubuntu` Linux user.

After connecting, the prompt looks similar to:

```text
ubuntu@ip-172-31-12-207:~$
```

At this point we are working directly inside the AWS server.

---

# 5. Install Docker

Docker is used to run the Maintix application.

The installed components include:

```text
Docker Engine
Docker CLI
containerd
Docker Buildx
Docker Compose
```

Verify:

```bash
sudo docker --version
sudo docker compose version
```

Test Docker:

```bash
sudo docker run hello-world
```

---

# 6. Install Git and Clone Maintix

Git is required to obtain the application source code.

Install Git:

```bash
sudo apt install git
```

Verify:

```bash
git --version
```

Clone the repository:

```bash
git clone <project-repository>
```

Move into the project:

```bash
cd maintix_equip_management
```

The deployment project structure is approximately:

```text
maintix_equip_management/
├── client/
├── server/
├── nginx.conf
└── docker-compose.yml
```

---

# 7. Install PostgreSQL on EC2

PostgreSQL was installed directly on the EC2 host rather than running PostgreSQL inside Docker.

Install:

```bash
sudo apt install postgresql postgresql-contrib
```

Verify:

```bash
psql --version
```

Check PostgreSQL:

```bash
sudo systemctl status postgresql
```

Check the PostgreSQL cluster:

```bash
sudo pg_lsclusters
```

Open PostgreSQL:

```bash
sudo -u postgres psql
```

---

# 8. Create the Maintix PostgreSQL User

Create the database user:

```sql
CREATE USER maintix_user WITH PASSWORD 'Enter_Password';
```

The actual password must never be committed to Git or written in public documentation.

---

# 9. Create the Maintix Database

Create the production database:

```sql
CREATE DATABASE maintix OWNER maintix_user;
```

Connect to it:

```sql
\c maintix
```

The distinction between a PostgreSQL **database** and **schema** is important.

For Maintix:

```text
Database → maintix
Schema   → maintix
User     → maintix_user
```

Changing the schema with `SET search_path` does not switch databases.

To switch databases in `psql`, use:

```sql
\c maintix
```

---

# 10. Create the Maintix Schema

Inside the `maintix` database:

```sql
CREATE SCHEMA maintix AUTHORIZATION maintix_user;
```

Grant the required permissions:

```sql
GRANT USAGE, CREATE ON SCHEMA maintix TO maintix_user;
```

The Prisma models are stored in the `maintix` schema.

---

# 11. Configure PostgreSQL for Docker

The PostgreSQL server is running on the EC2 host, while the NestJS application is running inside a Docker container.

Therefore, the container cannot use:

```text
localhost:5432
```

for the PostgreSQL connection.

Inside a container, `localhost` refers to the container itself.

Instead, the Docker containers connect to the EC2 host through the Docker bridge gateway:

```text
172.18.0.1
```

The Maintix Docker network uses:

```text
172.18.0.0/16
```

---

## Configure `postgresql.conf`

Find the configuration file:

```bash
sudo -u postgres psql -c "SHOW config_file;"
```

Open it:

```bash
sudo nano /etc/postgresql/18/main/postgresql.conf
```

Configure:

```text
listen_addresses = '*'
```

This allows PostgreSQL to listen for TCP connections on interfaces other than localhost.

---

## Configure `pg_hba.conf`

Find the file:

```bash
sudo -u postgres psql -c "SHOW hba_file;"
```

Add:

```text
host    maintix    maintix_user    172.18.0.0/16    scram-sha-256
```

This allows the Maintix Docker network to authenticate to the `maintix` database using the `maintix_user` account.

The rule belongs in:

```text
pg_hba.conf
```

not:

```text
postgresql.conf
```

Restart PostgreSQL:

```bash
sudo systemctl restart postgresql
```

---

# 12. Configure the Server Environment

The NestJS server requires environment variables for:

- PostgreSQL
- JWT authentication
- Cloudinary
- email
- client URL
- application configuration

These are stored on the EC2 server in:

```text
server/.env
```

The production database URL points to the EC2 Docker gateway:

```text
172.18.0.1:5432
```

The database uses the:

```text
maintix
```

database and:

```text
maintix
```

schema.

Secrets must not be committed to Git.

---

# 13. Maintix Docker Network

Docker Compose creates a custom network:

```yaml
networks:
  maintix-network:
    name: maintix-network
    driver: bridge
    ipam:
      config:
        - subnet: 172.18.0.0/16
```

The containers communicate using Docker service names.

For example:

```text
client:3000
server:5000
```

Docker's internal DNS resolves these service names to the corresponding container IP addresses.

The PostgreSQL host is reached through:

```text
172.18.0.1:5432
```

---

# 14. Server Docker Image

The NestJS application uses a multi-stage Docker build.

The stages are:

```text
dependencies
      ↓
builder
      ↓
production
```

The dependencies stage installs packages.

The builder stage:

```text
npm install
prisma generate
npm run build
```

The production stage contains only the files required to run the compiled application.

The production image uses:

```dockerfile
RUN npm ci --omit=dev
```

Therefore development dependencies such as `ts-node` are not included in the production image.

---

# 15. Client Docker Image

The Next.js application also uses a multi-stage Docker build.

The build stage runs:

```bash
npm run build
```

The production image uses the Next.js standalone output:

```text
.next/standalone
.next/static
public
```

The production container listens on:

```text
3000
```

The public API URL is configured as:

```text
/api
```

This allows the browser to communicate with the same public origin through Nginx.

---

# 16. Docker Compose

The final Compose architecture contains three services:

```text
server
client
nginx
```

The important configuration is:

```yaml
services:

  server:
    build:
      context: ./server
    container_name: maintix-server-container
    restart: unless-stopped
    env_file:
      - ./server/.env
    networks:
      - maintix-network

  client:
    build:
      context: ./client
    container_name: maintix-client-container
    restart: unless-stopped
    env_file:
      - ./client/.env.local
    depends_on:
      - server
    networks:
      - maintix-network

  nginx:
    image: nginx:alpine
    container_name: maintix-nginx
    restart: unless-stopped
    ports:
      - "80:80"
    volumes:
      - ./nginx.conf:/etc/nginx/nginx.conf:ro
    depends_on:
      - server
      - client
    networks:
      - maintix-network
```

The services are connected to:

```text
maintix-network
```

---

# 17. Nginx Reverse Proxy

Nginx is the public entry point for Maintix.

Configuration:

```nginx
events {}

http {
    server {
        listen 80;

        location / {
            proxy_pass http://client:3000;
        }

        location /api/ {
            proxy_pass http://server:5000;
        }
    }
}
```

The routing is:

```text
http://<EC2-IP>/
        ↓
      Nginx
        ↓
   client:3000
```

API requests:

```text
http://<EC2-IP>/api/*
        ↓
      Nginx
        ↓
   server:5000
```

This means the browser only needs one public endpoint.

---

# 18. Build the Docker Images

From the project root:

```bash
sudo docker compose build
```

This builds the:

```text
server
client
```

images.

During the initial deployment, the Next.js build exceeded the memory available on the original `t3.micro` instance.

After upgrading to `t3.small` and configuring swap, the Docker build completed successfully.

---

# 19. Start the Application

Start the services:

```bash
sudo docker compose up -d
```

Check the containers:

```bash
sudo docker compose ps
```

The expected services are:

```text
maintix-server-container
maintix-client-container
maintix-nginx
```

Check logs:

```bash
sudo docker compose logs
```

Or check a specific service:

```bash
sudo docker compose logs server
sudo docker compose logs client
sudo docker compose logs nginx
```

---

# 20. Verify Nginx Locally

From the EC2 server:

```bash
curl -I http://localhost
```

A successful deployment should return an HTTP response such as:

```text
HTTP/1.1 200 OK
```

This confirms that:

```text
EC2
 ↓
Nginx
 ↓
Next.js
```

is working.

---

# 21. Prisma Production Configuration

Maintix uses Prisma with PostgreSQL.

The project contains:

```text
server/prisma/schema.prisma
server/prisma/migrations/
server/prisma/seed.ts
server/prisma.config.ts
```

The Prisma configuration contains the migration path and seed command:

```ts
export default defineConfig({
  schema: 'prisma/schema.prisma',
  migrations: {
    path: 'prisma/migrations',
    seed: 'ts-node prisma/seed.ts',
  },
  datasource: {
    url: process.env.DATABASE_URL,
  },
});
```

The production server image must contain:

```text
prisma.config.ts
```

Without it, Prisma CLI commands that depend on the configuration fail because Prisma cannot obtain the datasource configuration.

The production Dockerfile therefore copies it into the final image.

---

# 22. Check Prisma Migration Status

Before changing the production database, check the migration status:

```bash
sudo docker compose run --rm server npx prisma migrate status
```

This confirmed that the production database was reachable and that all project migrations were available.

The deployment contained 28 Prisma migrations.

Initially, none of those migrations had been applied to the production database.

---

# 23. Deploy Prisma Migrations

Apply the migrations:

```bash
sudo docker compose run --rm server npx prisma migrate deploy
```

This applies existing migrations without resetting the database.

After successful execution:

```text
All migrations have been successfully applied.
```

Never use:

```bash
prisma migrate reset
```

against the production database because it is destructive.

---

# 24. Seed Production Roles

Maintix requires the following roles:

```text
ADMIN
MANAGER
TECHNICIAN
INSPECTOR
ENGINEER
```

The seed uses Prisma `upsert`, so running the seed again does not create duplicate roles.

The seed configuration uses:

```text
ts-node prisma/seed.ts
```

However, `ts-node` exists in `devDependencies`, while the production image installs dependencies with:

```dockerfile
npm ci --omit=dev
```

Therefore `ts-node` is intentionally not present in the production image.

Instead of adding a development dependency to the production image, a temporary image was created from the Docker builder stage:

```bash
sudo docker build --target builder -t maintix-server-seed ./server
```

The builder stage contains the development dependencies required by the seed command.

The seed can then be executed from that temporary image:

```bash
sudo docker run --rm \
  --env-file ./server/.env \
  --network maintix-network \
  maintix-server-seed \
  npx prisma db seed
```

The expected output is:

```text
Roles seeded successfully
```

---

# 25. Verify the Production Database

When querying PostgreSQL, remember that PostgreSQL has special keywords such as `USER`.

For example:

```sql
SELECT * FROM USER;
```

does not query the Maintix `User` table in the expected way.

Prisma-generated table names may be case-sensitive and therefore should be quoted.

For example:

```sql
SELECT * FROM maintix."Role";
```

can be used to inspect the Maintix Role table.

---

# 26. Final Production Verification

After deploying the containers, migrations, and seed data, the complete application was tested through the public EC2 address.

The following were verified:

```text
Frontend
   ✓ Loads successfully

Nginx
   ✓ Public HTTP entry point works

Next.js
   ✓ Frontend requests work

NestJS
   ✓ API requests work

PostgreSQL
   ✓ Database connection works

Prisma
   ✓ Migrations applied

Roles
   ✓ Seeded successfully

Authentication
   ✓ Login works

Application
   ✓ Production verification completed successfully
```

The Maintix application was successfully deployed.

---

# 27. Final Production Architecture

```text
                         Internet
                            │
                            │ HTTP :80
                            ▼
                 ┌────────────────────┐
                 │     AWS EC2        │
                 │      Ubuntu        │
                 │                    │
                 │  ┌──────────────┐  │
                 │  │    Nginx     │  │
                 │  │     :80      │  │
                 │  └──────┬───────┘  │
                 │         │           │
                 │  maintix-network    │
                 │    ┌────┴────┐      │
                 │    │         │      │
                 │    ▼         ▼      │
                 │ ┌───────┐ ┌───────┐│
                 │ │Client │ │Server ││
                 │ │ :3000 │ │ :5000 ││
                 │ └───────┘ └───┬───┘│
                 │                │    │
                 │                │    │
                 │                ▼    │
                 │          PostgreSQL │
                 │            :5432    │
                 └─────────────────────┘
```

Request routing:

```text
Browser
   │
   ├── /
   │     ↓
   │   Nginx
   │     ↓
   │  client:3000
   │
   └── /api/*
         ↓
       Nginx
         ↓
      server:5000
         ↓
      PostgreSQL
```

---

# 28. Important Production Lessons

## Public IP Can Change

The normal EC2 public IPv4 address can change when the instance is stopped and started.

Therefore, do not treat the current public IP as permanent.

An Elastic IP or domain can be introduced later if required.

## PostgreSQL Should Not Be Publicly Exposed

The application does not require PostgreSQL port `5432` to be open to the internet.

The database is accessed internally:

```text
Docker container
      ↓
172.18.0.1:5432
      ↓
PostgreSQL on EC2
```

## `depends_on` Does Not Mean Application Readiness

Docker Compose:

```yaml
depends_on:
  - server
```

controls startup ordering.

It does not guarantee that the NestJS application is already ready to accept requests.

## Production Images Should Not Need Development Dependencies

The production server uses:

```dockerfile
npm ci --omit=dev
```

This keeps development-only packages such as `ts-node` out of the final image.

For one-time tasks such as production seeding, a temporary builder image can be used instead.

## Prisma Migrations Should Be Deployed, Not Reset

Production databases should use:

```bash
npx prisma migrate deploy
```

rather than:

```bash
npx prisma migrate reset
```

---