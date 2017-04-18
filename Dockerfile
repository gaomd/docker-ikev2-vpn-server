FROM alpine:3.5

ENV HOST HOSTNAME

RUN apk update && apk upgrade \
    && apk add openssl util-linux strongswan bash \
    && rm -rf /var/cache/apk/* \
    && rm -f /etc/ipsec.secrets

ADD ./etc/* /etc/
ADD ./bin/* /usr/bin/

EXPOSE 500/udp 4500/udp

CMD /usr/bin/start-vpn

