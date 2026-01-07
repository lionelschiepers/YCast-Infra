sudo docker run -d --name pihole \
  -p 20301:8080 \
  --security-opt no-new-privileges=false \
  -v /volume1/docker/pihole/dnsmasq.d:/etc/dnsmasq.d:rw \
  -v /volume1/docker/pihole/pihole:/etc/pihole:rw \
  -e FTLCONF_webserver_api_password=pihole \
  -e FTLCONF_webserver_port=8080 \
  -e TZ=Europe/Brussels \
  -e FTLCONF_dns_listeningMode=all \
  -e DNSMASQ_USER=pihole \
  -e PIHOLE_UID=1026 \
  -e PIHOLE_GID=100 \
  --cap-add SYS_TIME \
  --cap-add SYS_NICE \
  --restart on-failure:5 \
  --net=bridge \
  pihole/pihole

  sudo docker run -d --name pihole \
  -p 20301:8080 \
  --security-opt no-new-privileges=false \
  -v /volume1/docker/pihole/dnsmasq.d:/etc/dnsmasq.d:rw \
  -v /volume1/docker/pihole/pihole:/etc/pihole:rw \
  -e FTLCONF_webserver_api_password=pihole \
  -e FTLCONF_webserver_port=8080 \
  -e TZ=Europe/Brussels \
  -e FTLCONF_dns_listeningMode=all \
  -e DNSMASQ_USER=pihole \
  -e PIHOLE_UID=1026 \
  -e PIHOLE_GID=100 \
  --cap-add SYS_TIME \
  --cap-add SYS_NICE \
  --restart on-failure:5 \
  --net=host \
  pihole/pihole