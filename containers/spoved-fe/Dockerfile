FROM root/spoved-nginx

WORKDIR /code

ADD ./.nginx ./.nginx

ENTRYPOINT [ "sh", "/bootstrap-nginx.sh" ]
