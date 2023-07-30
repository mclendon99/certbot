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
if [[ -z $GDDOMAIN  ]]
then
  [ -f ./certbot.conf ] && . ./certbot.conf
fi
# Still no domain, exit
if [[ -z $GDDOMAIN  ]]
then
    echo "Must supply GDDOMAIN in environment or certbot.conf file. Exiting!"
    exit -2
fi
# 
echo Using domain $GDDOMAIN
sudo certbot -d $GDDOMAIN  --manual --preferred-challenges dns certonly
