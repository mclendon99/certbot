# Certbot scripts

A collection of bash scripts to manage certificates generated by certbot.
Bash is required as the scripts use the `[[` operator.

The certbot.conf file is of the form:

GDDOMAIN=\\'Replace with your domain name (just the domain part - not the host part).\\'

Note that the quotes must be escaped.

The configuration items can also be read from the environment. The config file items
override the environment entries.

The following scripts are supplied:

* generate-cert.sh - invoke certbot to generate a manual certificate. Use the ddns/ddns-acme.sh script
              to respond to the challenges.
* certbot-tar.sh - Generate a tarball with all the certbot generated information. Useful
              for putting the certificates onto another system. The script takes no
              arguments.
