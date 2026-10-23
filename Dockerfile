FROM node:20-alpine

# Define diretório de trabalho
WORKDIR /usr/src/app

# Define ambiente como produção
ENV NODE_ENV=production

# Copia apenas os arquivos de pacotes primeiro para aproveitar o cache
COPY package*.json ./

# Instala apenas dependências de produção e limpa o cache para reduzir o tamanho da imagem
RUN npm ci --only=production && npm cache clean --force

# Copia o restante do código (respeitando o .dockerignore)
COPY . .

# Muda para o usuário 'node' (segurança em produção para não rodar como root)
USER node

EXPOSE 3000

# Inicia a aplicação diretamente com o node (mais leve e seguro que npm start)
CMD ["node", "src/index.js"]