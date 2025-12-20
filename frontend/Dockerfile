# Dockerfile dentro de frontend/
FROM node:20-bookworm-slim

WORKDIR /app

# Copia só package.json para aproveitar cache
COPY package*.json ./
RUN npm ci

# Copia o restante do código
COPY . .

EXPOSE 5173

CMD ["npm", "run", "dev", "--", "--host"]
