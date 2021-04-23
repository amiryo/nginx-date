FROM alpine:3.2
RUN apk add --update nginx && rm -rf /var/cache/apk/*
COPY conf/index.html /usr/share/nginx/html/index.html
COPY conf/nginx.conf /etc/nginx/nginx.conf
CMD ["nginx", "-g", "daemon off;"]
RUN chown -R nginx:nginx /var/log/nginx/ 
RUN chown -R nginx:nginx /var/lib/nginx/ 
RUN chown -R nginx:nginx /usr/sbin/nginx
RUN chown -R nginx:nginx /var/run/nginx/
USER nginx

EXPOSE 8081
