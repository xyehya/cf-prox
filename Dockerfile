FROM alpine:latest

# Install build dependencies and runtime requirements
RUN apk add --no-cache \
    gcc \
    g++ \
    make \
    linux-headers \
    wget \
    && wget https://github.com/3proxy/3proxy/archive/0.9.4.tar.gz \
    && tar xzf 0.9.4.tar.gz \
    && cd 3proxy-0.9.4 \
    && make -f Makefile.Linux \
    && mkdir -p /usr/local/bin /etc/3proxy \
    && cp bin/3proxy /usr/local/bin/ \
    && cd .. \
    && rm -rf 3proxy-0.9.4 0.9.4.tar.gz \
    && apk del gcc g++ make linux-headers wget

# Copy configuration
COPY 3proxy.cfg /etc/3proxy/3proxy.cfg

# Expose proxy port
EXPOSE 3128

# Run 3proxy
CMD ["/usr/local/bin/3proxy", "/etc/3proxy/3proxy.cfg"]
