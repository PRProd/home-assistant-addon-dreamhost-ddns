#!/usr/bin/with-contenv bashio

CONFIG_PATH=/data/options.json

API_KEY=$(bashio::config 'api_key')
DNS_RECORD=$(bashio::config 'dns_record')
INTERVAL=$(bashio::config 'interval')

echo "Starting DreamHost DDNS updater"
echo "Record: $DNS_RECORD"
echo "Interval: $INTERVAL seconds"

while true; do
    /usr/bin/dreamhost-ddns --verbose \
        --api-key "$API_KEY" \
        --record "$DNS_RECORD"

    sleep "$INTERVAL"
done
