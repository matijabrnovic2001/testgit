ARG NODE_VERSION=18
FROM node:$NODE_VERSION AS angular

WORKDIR /app

COPY . .

RUN npm install
RUN npm run build --configuration=production

FROM httpd:alpine3.21

WORKDIR /usr/local/apache2/htdocs
COPY --from=angular /app/dist/angular-frontend .
