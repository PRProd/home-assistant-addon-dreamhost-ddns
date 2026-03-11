#!/usr/bin/with-contenv bashio

CONFIG_PATH=/data/options.json

API_KEY=$(bashio::config 'api_key')
DNS_RECORD=$(bashio::config 'dns_record')
INTERVAL=$(bashio::config 'interval')
LOG_LEVEL=$(bashio::config 'log_level')

bashio::log.info "Starting DreamHost DDNS updater"
bashio::log.info "Record: $DNS_RECORD"
bashio::log.info "Interval: $INTERVAL seconds"
bashio::log.info "Log level: $LOG_LEVEL"

while true; do
    /usr/bin/dreamhost-ddns \
        --log-level "$LOG_LEVEL" \
        --api-key "$API_KEY" \
        --record "$DNS_RECORD"

    sleep "$INTERVAL"
done
