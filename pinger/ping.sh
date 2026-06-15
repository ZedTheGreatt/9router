#!/bin/sh
# Lightweight cronjob pinger for Render free-tier services.
# Pings PINGER_TARGET_URL to prevent the web service from sleeping.
# Used by Render Cron Job service (render.yaml).

set -e

TARGET="${PINGER_TARGET_URL:?PINGER_TARGET_URL is not set}"

echo "$(date -u +%Y-%m-%dT%H:%M:%SZ) Pinging ${TARGET} ..."

HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" --max-time 30 "${TARGET}")

echo "$(date -u +%Y-%m-%dT%H:%M:%SZ) Response: HTTP ${HTTP_CODE}"

if [ "$HTTP_CODE" -ge 200 ] && [ "$HTTP_CODE" -lt 300 ]; then
  echo "OK"
  exit 0
else
  echo "WARN: non-2xx response"
  exit 1
fi
