# Stage 1: Install dependencies
FROM node:24-bookworm-slim AS dependencies

WORKDIR /app

COPY package*.json ./

RUN npm ci

# Stage 2: Build the application
FROM node:24-bookworm-slim AS builder

WORKDIR /app

COPY --from=dependencies /app/node_modules ./node_modules
# This COPY . . command copies the entire application code into the container.
# Make sure to include a .dockerignore file to exclude unnecessary files and directories from being copied into the container.
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