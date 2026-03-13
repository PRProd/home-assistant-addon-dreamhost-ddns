#!/usr/bin/with-contenv bashio

CONFIG_PATH=/data/options.json

bashio::config.require 'api_key'
bashio::config.require 'dns_record'

API_KEY=$(bashio::config 'api_key')
DNS_RECORD=$(bashio::config 'dns_record')
INTERVAL=$(bashio::config 'interval')
LOG_LEVEL=$(bashio::config 'log_level')
IP_MODE=$(bashio::config 'ip_mode')

FLAGS=""

if [ "$IP_MODE" = "ipv4" ]; then
    FLAGS="--ipv4-only"
elif [ "$IP_MODE" = "ipv6" ]; then
    FLAGS="--ipv6-only"
fi

bashio::log.info "Starting DreamHost DDNS updater"
bashio::log.info "Record: $DNS_RECORD"
bashio::log.info "Interval: $INTERVAL seconds"
bashio::log.info "Log level: $LOG_LEVEL"

while true; do
    /usr/bin/dreamhost-ddns \
        --log-level "$LOG_LEVEL" \
        --api-key "$API_KEY" \
        --record "$DNS_RECORD" \
        $FLAGS

    sleep "$INTERVAL"
done
