FROM node:20-bookworm-slim

RUN apt-get update \
 && apt-get install -y --no-install-recommends ffmpeg \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY package*.json ./
RUN npm ci

COPY . .

RUN npm run build   # <--- agora vai funcionar

RUN mkdir -p /videos

EXPOSE 3000

CMD ["npm", "run", "start"]
