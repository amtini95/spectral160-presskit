FROM nginx:1.27-alpine

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY spectral160-presskit/index.html /usr/share/nginx/html/index.html
COPY spectral160-presskit/media/ /usr/share/nginx/html/media/

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 \
  CMD wget -q --spider http://127.0.0.1/ || exit 1
