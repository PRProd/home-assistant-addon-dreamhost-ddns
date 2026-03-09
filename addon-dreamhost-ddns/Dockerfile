ARG BUILD_FROM
FROM $BUILD_FROM

ARG BUILD_ARCH

COPY ./bin/${BUILD_ARCH}/dreamhost-ddns /usr/bin/dreamhost-ddns
COPY run.sh /run.sh
COPY config.toml /config.toml
WORKDIR /

RUN chmod +x /run.sh \
    && chmod +x /usr/bin/dreamhost-ddns

CMD [ "/run.sh" ]