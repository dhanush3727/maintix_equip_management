# Docker Compose
Docker Compose is used to define and run multiple Docker containers as a single application.
For Maintix, Docker Compose manages three services:
* Server — NestJS backend
* Client — Next.js frontend
* Nginx — Reverse proxy that routes requests to the client and server

## Docker compose configuration
```yml
name: maintix

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
    depends_on:
      - server
    networks:
      - maintix-network

  nginx:
    image: nginx:alpine
    container_name: maintix-nginx
    restart: unless-stopped
    ports:
      - "8080:80"
    volumes:
      - ./nginx.conf:/etc/nginx/nginx.conf:ro
    depends_on:
      - server
      - client
    networks:
      - maintix-network

networks:
  maintix-network:
    driver: bridge
```
### Project Name:
`name: maintix` - Defines the name of the Docker Compose project. Docker Compose uses this name to group the containers, networks, and other resources belonging to the same application.

### Services
`services`: Defines the containers that make up the Maintix application.
Maintix contains three services:
* server
* client
* nginx
Each service represents a container.

### Server Service:
```yml
server:
    build:
      context: ./server
    container_name: maintix-server-container
    restart: unless-stopped
    env_file:
      - ./server/.env
    networks:
      - maintix-network
```
- Build the server Docker image using the `Dockerfile` inside the `server` directory. The build context is `./server`. So Docker can access files inside the `server` directory during the image build.
- `container_name: maintix-server-container`, Gives the server container a custom name. Instead of Docker generating a name automatically, the container will be called `maintix-server-container`.
- `restart: unless-stopped`, automatically restarts the container if it stops unexpectedly. It will continue restarting unless the container was explicityly stopped by the user.
- `env_file: -./server/.env`, loads environment variables from the server's `.env` file into the container.
- `networks: -maintix-network`, connects the server container to the `maintix-network` Docker network. This allows other containers connected to the same network to communicate with the server.

### Client Service:
```yml
  client:
    build:
      context: ./client
    container_name: maintix-client-container
    restart: unless-stopped
    depends_on:
      - server
    networks:
      - maintix-network
```
- Builds the Next.js frontend using the `Dockerfile` inside the `client` directory.
- `container_name: maintix-client-container`, gives the frontend container a custom name.
- `restart: unless-stopped`, automatically restarts the client container if it stops unexpectedly.
- `depends_on: - server`, tells Docker Compose that the client service depends on the server service. Docker compose starts the server before starting the clien.
*Notes: `depends_on` controls startup order. It does not guarantee that the server application is fully ready to accept request.*
- `networks: - maintix-network`, connects the client to the same Docker network as the server. Therefore, containers can communicate with each other through Docker's internal DNS.

### Nginx Service:
```yml
  nginx:
    image: nginx:alpine
    container_name: maintix-nginx
    restart: unless-stopped
    ports:
      - "8080:80"
    volumes:
      - ./nginx.conf:/etc/nginx/nginx.conf:ro
    depends_on:
      - server
      - client
    networks:
      - maintix-network
```
- Uses the official lightweight Nginx Alpine image instead of building a custom image. Nginx acts as a reverse proxy in the maintix architecture. It receives requests from the browser and routes them to either the frontend or backend container.
- `container_name: maintix-nginx`, Gives the Nginx container a custom name.
- `restart: unless-stopped`, Automatically restarts Nginx if it stops unexpectedly.
- `ports: - "8080:80"`, Maps the host port 8080 to the Nginx container's port 80. The format is `HOST_PORT:CONTAINER_PORT`. Therefore when we open `localhost:8080` Docker forwards the request to port `80` inside the Nginx container. Nginx listens on port `80` using `listen 80;`.
- `volumes: - ./nginx.conf:/etc/nginx/nginx.conf:ro`, Mounts the local `nginx.conf` file into the Nginx container. The format is `LOCAL_PATH:CONTAINER_PATH:MODE`. Therefore `./nginx.conf` -> `/etc/nginx/nginx.conf`. The `:ro` means read-only. Nginx can read the configuration file but cannot modify the local file through this mount.
- `depends_on: - server - client`, Tells Docker Compose to start the server and client services before starting Nginx.
- `networks: - maintix-network`, Connects Nginx to the same Docker network as the client and server. This allows Nginx to communicate with, `client:3000`, `server:5000`.
*Notes: Volumes / Bind Mount: Used to make a host file or folder available inside a running Docker container. Mount: Connects the host file/folder to a specific path inside the container. :ro → Read-only access.*

### Docker Network
```yml
networks:
  maintix-network:
    driver: bridge
```
- Creates a custom Docker bridge network called, `maintix-network`,
All three services are connected to this network:

             maintix-network
                    │
        ┌───────────┼───────────┐
        ↓           ↓           ↓
      nginx       client      server
       :80         :3000        :5000
- Because they are on the same Docker network, Nginx can access the services using their Compose service names: `client:3000`, `server:5000`.
- Docker's internal DNS resolves these service names to the corresponding container IP addresses.

## Nginx Configuration
```nginx
events {}

http {
    server {
        listen 80;

        location / {
            proxy_pass http://client:3000;
        }

        location /api/  {
            proxy_pass http://server:5000;
        }
    }
}
```
### events {}
`events {}`, Defines the Nginx events configuration. For this simple reverse-proxy setup, no additional event configuration is required.

### HTTP Configuration
`http {}`, Defines the HTTP configuration for Nginx. The server block is placed inside this section.

### Server Block
`server {}`
- Creates an Nginx server that listens on port 80 inside the container. This matches the Docker Compose port mapping:
```yml
ports: 
    - "8080:80"
```
Therefore:
Browser
   ↓
localhost:8080
   ↓
Docker
   ↓
Nginx:80

### Route Frontend Requests
```nginx
location / { 
    proxy_pass http://client:3000; 
}
```
- Any request that does not match /api/ is forwarded to the Next.js client. For example: `GET /`, `GET /login`, `GET /dashboard`. Will be forwarded to `client: 3000`. The complete flow is:
```text
Browser 
    ↓ 
localhost:8080/login 
    ↓ 
Nginx 
    ↓ 
client:3000 
    ↓ 
Next.js
```

### Route Backend API requests
```nginx
location /api/  {
            proxy_pass http://server:5000;
    }
```
- Requests beginning with `/api/` are forwarded to the NestJS server. For example: `POST /api/auth/login`, `GET /api/equipment`, `GET /api/dashboard`. are routed to: `server: 5000`. The complete flow is:
```text
Browser 
    ↓ 
localhost:8080/api/auth/login 
    ↓ 
Nginx 
    ↓ 
server:5000 
    ↓
NestJS
```