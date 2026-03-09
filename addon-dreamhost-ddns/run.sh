#!/usr/bin/with-contenv bashio

API_KEY=$(bashio::config 'api_key')
DNS_RECORD=$(bashio::config 'dns_record')
INTERVAL=$(bashio::config 'interval')

echo "Starting DreamHost DDNS updater"
echo "Record: $DNS_RECORD"
echo "Interval: $INTERVAL seconds"
sleep 5
ls -l /usr/bin/dreamhost-ddns

while true; do
    /usr/bin/dreamhost-ddns \
        --api-key "$API_KEY" \
        --record "$DNS_RECORD"

    sleep "$INTERVAL"
done
