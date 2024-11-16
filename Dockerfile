# Usa a imagem oficial do Node.js com Alpine 
FROM node:12-alpine
# Defina o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copiar do arquivo geral de depêndencias
# Verifica se exite alterações
# Caso não tenha, evita que as dependências sejan reinstaladas (CACHED)
COPY package.json .

#-------------------Instalando as depêndencias-------------------
RUN apk add --no-cache python2 g++ make
RUN yarn install --production

## ENV esta aplicação não requer uso de uma outra aplicação API

# Copiar o código da aplicação
# Caso tenha arquivos novos a perfomance não é afetada.
COPY . .

#Comando para executar a aplicação após criação da imagem
CMD [ "node", "src/index.js" ]

#Expor a porta
EXPOSE 3000
