
FROM linuxserver/wireguard:arm32v7-version-v1.0.20200827

COPY insmod.sh /etc/cont-init.d/20-insmod

RUN chmod +x /etc/cont-init.d/20-insmod
