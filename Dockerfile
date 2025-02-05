FROM node:12-alpine AS BUILD

WORKDIR /app
COPY ./package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx

COPY --from=BUILD /app/build usr/share/nginx/html

