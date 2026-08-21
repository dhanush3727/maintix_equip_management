# Server containerization

Create a `Dockerfile` inside `server`.

```dockerfile
# Stage 1: Install dependencies
FROM node:24-bookworm-slim AS dependencies

WORKDIR /app

COPY package*.json ./

RUN npm ci

# Stage 2: Build the application
FROM node:24-bookworm-slim AS builder

WORKDIR /app

COPY --from=dependencies /app/node_modules ./node_modules
COPY . .

RUN npx prisma generate
RUN npm run build

# Stage 3: Production Image
FROM node:24-bookworm-slim AS production

WORKDIR /app

ENV NODE_ENV=production

COPY package*.json ./

RUN npm ci --omit=dev

COPY --from=builder /app/dist ./dist
COPY --from=builder /app/node_modules/.prisma ./node_modules/.prisma
COPY --from=builder /app/prisma ./prisma

EXPOSE 5000

CMD [ "node", "dist/src/main.js" ]
```
## Why we doing it this way?
This is a multi-stage Docker build.
1. `FROM node:24-bookworm-slim`:
- We are starting from a lightweight Linux image that already contains Node.js.
- Instead of installing Node.js manually inside the container, Docker gives us an environment where Node is already available.

2. `WORKDIR`:
- This tells Docker, Inside this container, `/app` is where my application lives.
- So commands such as
```dockerfile
COPY .
RUN npm ci
```
operate relative to `/app`.

3. Copy package files first:
```dockerfile
COPY package*.json ./
RUN npm ci
```
- We deliberately copy `package.json` and `package-lock.json` before copying the source code. Why?
- This take the `package.json` cache if we change it in files then docker use the exist cache don't again run it.
- If we change `package.json` then it run `npm ci`

4. Build the NestJS application
```dockerfile
RUN npx prisma generate
RUN npm run build
```
Your TypeScript/NestJS source isn't what Node runs directly in production. It gets compiled:
```text
src/
 ↓
npm run build
 ↓
dist/
```
So the production container ultimately runs `dist/main.js`.

5. Why three stages?
- We have three stages that is dependencies, builder, production.
- The first stages are used to prepare the application. 
- The final stage contains only what is necessary to run the application. 
- For example, you don't want your production container carrying unnecessary development dependencies so production does `RUN npm ci --omit=dev`. It omit dev dependencies. 
- That keeps the final image smaller and reduces unnecessary software inside the production container.

6. Prisma
- Run the prisma because we use prisma for our maintix `RUN npx prisma generate` generates Prisma Client and 
```dockerfile
COPY --from=builder /app/node_modules/.prisma ./node_modules/.prisma
COPY --from=builder /app/prisma ./prisma
```
- makes the required Prisma files/schema available to the production container.

7. EXPOSE
`EXPOSE 5000`:
- This documents that your NestJS application listens on port 5000.
- It does not actually publish the port to your machine. We'll do that when running the container.

8. CMD
`CMD ["node", "dist/src/main.js"]`:
- This is the command Docker executes when the container starts.

So conceptually:
```text
docker run
    ↓
container starts
    ↓
node dist/main.js
    ↓
NestJS starts
    ↓
Server listens on port 5000
```

9. Change the postgreSQL local to docker
in the `.env` file we change the localhost to host.docker.internal