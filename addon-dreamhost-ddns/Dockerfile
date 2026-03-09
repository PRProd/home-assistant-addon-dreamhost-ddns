ARG BUILD_FROM
FROM $BUILD_FROM

COPY dreamhost-ddns /usr/bin/dreamhost-ddns
COPY run.sh /run.sh

RUN chmod +x /run.sh \
    && chmod +x /usr/bin/dreamhost-ddns

CMD [ "/run.sh" ] 