FROM node:17-alpine

RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app

WORKDIR /home/node/app

USER node

COPY --chown=node:node ./package*.json .

RUN npm install

COPY --chown=node:node . .

RUN ls

EXPOSE 8080

CMD [ "node", "server.js" ]