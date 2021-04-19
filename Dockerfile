FROM node:14 AS builder

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

FROM node:lts-alpine3.13

WORKDIR /usr/src/app

COPY --from=builder /usr/src/app/ /usr/src/app/

EXPOSE 80

CMD [ "node", "server.js" ]