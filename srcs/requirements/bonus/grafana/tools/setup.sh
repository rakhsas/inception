#!/bin/bash

systemctl enable grafana-server
# service grafana-server status
service grafana-server start

# grafana-cli admin reset-admin-password ${GRAFANA_PASS}    

/usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf