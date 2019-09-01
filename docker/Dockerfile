FROM r.j3ss.co/wireguard:tools

RUN apk add --no-cache iptables

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]
