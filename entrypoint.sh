#!/bin/sh
set -eu

CONF="/etc/tinyproxy/tinyproxy.conf"

# Render provides $PORT automatically; default to 8888 if not set locally
: "${PORT:=8888}"

# Replace existing Port directive or append it
if grep -qE '^[[:space:]]*Port[[:space:]]+' "$CONF"; then
  sed -i -E "s/^[[:space:]]*Port[[:space:]]+.*/Port ${PORT}/" "$CONF"
else
  echo "Port ${PORT}" >> "$CONF"
fi

echo "Starting tinyproxy with PORT=${PORT}"
echo "---- tinyproxy.conf head ----"
head -n 60 "$CONF" || true
echo "-----------------------------"

# exec tinyproxy in foreground so logs show in Render
exec tinyproxy -c "$CONF" -d
