FROM node:19 as build

RUN apt update; apt install -y git
RUN git clone https://github.com/spacebarchat/client.git
RUN mv client spacebar-client
WORKDIR /spacebar-client
RUN git pull
RUN yarn install
RUN yarn build:web

FROM nginx:stable-alpine

COPY --from=build /spacebar-client/web-build/* /usr/share/nginx/html/.
COPY deploy.sh /docker-entrypoint.d/40-server-env-set.sh
COPY nginx.conf /etc/nginx/nginx.conf

WORKDIR /usr/share/nginx/html
