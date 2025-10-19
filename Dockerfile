FROM alpine:latest

# install tinyproxy
RUN apk add --no-cache tinyproxy

# copy config and entrypoint
COPY tinyproxy.conf /etc/tinyproxy/tinyproxy.conf
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# expose (for readability; Render enforces actual binding via $PORT)
EXPOSE 8888

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
