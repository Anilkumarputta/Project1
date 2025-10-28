FROM node:18-alpine
WORKDIR /usr/src/app
RUN apk add --no-cache python3 make g++ sqlite sqlite-dev
COPY package.json package-lock.json* ./
RUN npm ci --production
COPY . .
RUN npm run init-db
EXPOSE 3000
CMD ["npm", "start"]
