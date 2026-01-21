FROM node:18 AS builder
WORKDIR /bezkoder-app

COPY package*.json ./
RUN npm install
COPY . .

FROM node:18-alpine
WORKDIR /bezkoder-app
COPY --from=builder /bezkoder-app/ ./
RUN npm prune --omit=dev
USER node
EXPOSE 8080
ENTRYPOINT ["node", "server.js"]
