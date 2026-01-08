# exposed on NAS with port 20201

FROM trafficserver/trafficserver AS production

# Install a small HTTP client for the healthcheck. Avoid full update/upgrade to keep image small.
RUN apt -y update && \
    apt -y upgrade && \
    apt -y install nano net-tools iftop curl iputils-ping bind9-host bind9-dnsutils

COPY records.yaml  /opt/etc/trafficserver/records.yaml
COPY plugin.config /opt/etc/trafficserver/plugin.config

RUN echo 'domain home' >> /etc/resolv-trafficserver.conf

EXPOSE 8080

# the address of the dns server pihole is retrieve from the host file
# populated by synology docker when the container is started (linked container)
CMD ["/bin/sh", "-c", "echo nameserver $(getent hosts pihole | cut -d ' ' -f1) >> /etc/resolv-trafficserver.conf; traffic_server"]
