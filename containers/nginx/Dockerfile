FROM nginx:1.23.3-alpine

WORKDIR /

ADD ./bootstrap-nginx.sh ./bootstrap-nginx.sh

ENTRYPOINT [ "sh", "/bootstrap-nginx.sh" ]
