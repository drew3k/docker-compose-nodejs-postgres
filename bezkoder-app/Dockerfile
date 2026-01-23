FROM node:20-alpine AS builder
WORKDIR /bezkoder-app
COPY package*.json ./
RUN npm prune --omit=dev

FROM node:20-alpine
WORKDIR /bezkoder-app
COPY --from=builder /bezkoder-app/node_modules node_modules
COPY . .
EXPOSE 8080
ENTRYPOINT ["node", "server.js"]
