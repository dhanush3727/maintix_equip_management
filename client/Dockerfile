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

RUN npm run build

# Stage 3: Production Image
FROM node:24-bookworm-slim AS production

WORKDIR /app

ENV NODE_ENV=production

COPY --from=builder /app/public ./public
COPY --from=builder /app/.next/standalone ./
COPY --from=builder /app/.next/static ./.next/static

EXPOSE 3000

CMD [ "node", "server.js" ]