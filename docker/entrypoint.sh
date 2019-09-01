#!/bin/sh

set -xeu

WG_INTERFACE="${WG_INTERFACE:-wg0}"
EXT_INTERFACE="${EXT_INTERFACE:-eth0}"

ip link add dev "${WG_INTERFACE}" type wireguard
ip address add dev "${WG_INTERFACE}" "${WG_IP_RANGE}"

wg set "${WG_INTERFACE}" listen-port "${WG_LISTEN_PORT}" private-key "${WG_PRIVATE_KEY_FILE}" peer "${WG_PEER_PUBLIC_KEY}" allowed-ips "${WG_PEER_IP_RANGE}"

ip link set up dev "${WG_INTERFACE}"

iptables -A FORWARD -i "${WG_INTERFACE}" -j ACCEPT
iptables -t nat -A POSTROUTING -o "${EXT_INTERFACE}" -j MASQUERADE

mkfifo /tmp/quit
</tmp/quit
