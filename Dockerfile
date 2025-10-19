FROM alpine:latest

# Install 3proxy
RUN apk add --no-cache 3proxy

# Copy configuration
COPY 3proxy.cfg /etc/3proxy/3proxy.cfg

# Expose proxy port
EXPOSE 3128

# Run 3proxy
CMD ["3proxy", "/etc/3proxy/3proxy.cfg"]
