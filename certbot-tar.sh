#! /bin/sh
cd /
sudo tar czf certs.tgz /var/log/letsencrypt /etc/letsencrypt
echo 'Generated /certs.tgz (root directory). Move it somewhere else.'
echo 'Extract it with cd / && sudo tar xhzf certs.tgz'
