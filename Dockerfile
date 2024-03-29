FROM alpine
RUN apk update && apk add --no-cache postfix openssl
RUN mv /etc/postfix/main.cf /etc/postfix/main.cf.org
COPY --chmod=700 main.cf.template /etc/postfix/
COPY --chmod=700 run.sh /

EXPOSE 25

ENV HOSTNAME mail.example.com

ENV DOMAINS example.com
ENV FORWARD1 @example.com myaddress@gmail.com

CMD /run.sh
