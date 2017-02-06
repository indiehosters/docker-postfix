#!/bin/bash -eu

sed -i "s/##DB_PASS##/${DB_ENV_MYSQL_PASSWORD}/" /etc/postfix/virtual-mailbox-domains.cf
sed -i "s/##DB_PASS##/${DB_ENV_MYSQL_PASSWORD}/" /etc/postfix/virtual-mailbox-maps.cf
sed -i "s/##DB_PASS##/${DB_ENV_MYSQL_PASSWORD}/" /etc/postfix/virtual-alias-maps.cf
sed -i "s/##HOSTNAME##/$(hostname --fqdn)/" /etc/postfix/main.cf

/opt/mysql-check.sh

if [ ! -f /etc/opendkim/TrustedHosts ]; then
  mkdir -p /etc/opendkim
  echo "127.0.0.1" > /etc/opendkim/TrustedHosts
fi
