#!/bin/bash
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

# Check environment first. Still no domain? Try the config file
if [[ -z $MYDOMAIN  ]]
then
  [ -f ./certbot.conf ] && . ./certbot.conf
fi
# Still no domain, exit
if [[ -z $MYDOMAIN  ]]
then
    echo "Must supply MYDOMAIN in environment or certbot.conf file. Exiting!"
    exit -2
fi
# 
echo Using domain $MYDOMAIN
sudo certbot -d $MYDOMAIN  --manual --preferred-challenges dns certonly
