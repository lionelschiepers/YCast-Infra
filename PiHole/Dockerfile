# exposed on NAS with port 20101

FROM trafficserver/trafficserver AS production

# Install a small HTTP client for the healthcheck. Avoid full update/upgrade to keep image small.
RUN apt -y update && \
    apt -y upgrade && \
    apt -y install nano net-tools iftop curl


COPY records.yaml /opt/etc/trafficserver/records.yaml

RUN echo 'domain home' >> /etc/resolv-trafficserver.conf

EXPOSE 8080

CMD ["/bin/sh", "-c", "echo nameserver $(getent hosts pihole-pihole-1 | cut -d ' ' -f1) >> /etc/resolv-trafficserver.conf; traffic_server"]
