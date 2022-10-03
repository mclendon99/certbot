#!/bin/sh
# set -x
# This script will generate or renew a  certbot certificate for the specified MYDOMAIN manually.
# Use the ddns-acme.sh script to put the ACME challenge onto godaddy.
# Note that MYDOMAIN may contain multiple domains (with wildcards), e.g. "somedomain.com,*.somedomain.com",
# so put it in escaped quotes, e.g. \'mydomain.org\'.
if [[ $# -gt 0 ]]
then
    echo "This script takes no arguments. Exiting!"
    exit -1
fi

# Support env variables as well as config file
[ -f ./certbot.conf ] && . ./certbot.conf

if [[ -z $MYDOMAIN  ]]
then
    echo "Must supply MYDOMAIN in environment or certbot.conf file. Exiting!"
    exit -2
fi
# 
sudo certbot -d '$MYDOMAIN'  --manual --preferred-challenges dns certonly
