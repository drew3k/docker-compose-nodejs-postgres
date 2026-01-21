FROM node:18-alpine AS builder
WORKDIR /bezkoder-app

COPY package*.json ./
RUN npm install
COPY . .

FROM node:18-alpine
WORKDIR /bezkoder-app

RUN npm prune --omit=dev

COPY --from=builder /bezkoder-app/ ./

USER node
EXPOSE 8080

CMD ["node", "server.js"]
