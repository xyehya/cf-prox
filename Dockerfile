FROM alpine:latest

# Install tinyproxy (available in Alpine repos - no compilation needed)
RUN apk add --no-cache tinyproxy

# Copy configuration
COPY tinyproxy.conf /etc/tinyproxy/tinyproxy.conf

# Expose proxy port
EXPOSE 8888

# Run tinyproxy in foreground
CMD ["tinyproxy", "-d", "-c", "/etc/tinyproxy/tinyproxy.conf"]
