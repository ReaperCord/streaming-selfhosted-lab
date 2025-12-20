FROM node:20-bookworm-slim

# 1. Dependências do sistema
RUN apt-get update \
 && apt-get install -y --no-install-recommends ffmpeg \
 && rm -rf /var/lib/apt/lists/*

# 2. Diretório de trabalho
WORKDIR /app

# 3. Copiar manifests primeiro (cache de build)
COPY backend/package*.json ./

# 4. Instalar dependências
RUN npm ci

# 5. Copiar código
COPY backend/ .

# 6. Build do TypeScript
RUN npm run build

# 7. Diretório para vídeos (volume)
RUN mkdir -p /videos

# 8. Porta exposta
EXPOSE 3000

# 9. Start
CMD ["npm", "run", "start"]
