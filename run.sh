#!/bin/sh

# Reset main.cf
cp /etc/postfix/main.cf.template /etc/postfix/main.cf

# Configure main.cf
echo "myhostname = $HOSTNAME" >> /etc/postfix/main.cf
echo "virtual_alias_domains = $DOMAINS" >> /etc/postfix/main.cf

# Generate TLS certificate
openssl req -newkey rsa:4096 -nodes -sha512 -x509 -days 3650 -nodes -out cert.pem -keyout key.pem -subj "/C=NL/ST=Noord-Holland/L=Amsterdam/O=Organization/OU=IT/CN=$HOSTNAME/emailAddress=admin@$HOSTNAME"
cat key.pem cert.pem > /etc/postfix/chain.pem
chmod go= /etc/postfix/chain.pem

# Configure forwards in virtual
echo $FORWARD1 > /etc/postfix/virtual
echo $FORWARD2 >> /etc/postfix/virtual
echo $FORWARD3 >> /etc/postfix/virtual
echo $FORWARD4 >> /etc/postfix/virtual
echo $FORWARD5 >> /etc/postfix/virtual
echo $FORWARD6 >> /etc/postfix/virtual
echo $FORWARD7 >> /etc/postfix/virtual
echo $FORWARD8 >> /etc/postfix/virtual
echo $FORWARD9 >> /etc/postfix/virtual
echo $FORWARD10 >> /etc/postfix/virtual
postmap /etc/postfix/virtual

# Show parameters
echo "Hostname:   $HOSTNAME"
echo "Domains:    $DOMAINS"
echo "Forward  1: $FORWARD1"
echo "Forward  2: $FORWARD2"
echo "Forward  3: $FORWARD3"
echo "Forward  4: $FORWARD4"
echo "Forward  5: $FORWARD5"
echo "Forward  6: $FORWARD6"
echo "Forward  7: $FORWARD7"
echo "Forward  8: $FORWARD8"
echo "Forward  9: $FORWARD9"
echo "Forward 10: $FORWARD10"

# Run POSTFIX
postfix -v start-fg
