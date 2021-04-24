FROM alpine:3.2

RUN apk add --update nginx && rm -rf /var/cache/apk/*

COPY conf/index.html /usr/share/nginx/html/index.html

COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN chown -R nginx:nginx /var/log/nginx/ && \
        chown -R nginx:nginx /var/lib/nginx/ && \
        chown -R nginx:nginx /usr/sbin/nginx && \
        chown -R nginx:nginx /var/run/nginx/
USER nginx

CMD ["nginx", "-g", "daemon off;"]

EXPOSE 8081
