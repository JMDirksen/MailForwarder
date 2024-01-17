#!/bin/sh
echo 'maillog_file = /dev/stdout' >> /etc/postfix/main.cf
echo "virtual_alias_domains = $DOMAINS" >> /etc/postfix/main.cf
echo $FORWARD1 >> /etc/postfix/virtual
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
postfix -v start-fg
