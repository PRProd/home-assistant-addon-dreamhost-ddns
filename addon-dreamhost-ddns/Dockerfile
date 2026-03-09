ARG BUILD_FROM
FROM $BUILD_FROM

COPY run.sh /run.sh
COPY dreamhost-ddns /usr/bin/dreamhost-ddns
COPY config.toml /config.toml
WORKDIR /

RUN chmod +x /run.sh \
    && chmod +x /usr/bin/dreamhost-ddns

CMD [ "/run.sh" ]