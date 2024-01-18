FROM alpine
RUN apk update && apk add --no-cache postfix
RUN cp /etc/postfix/main.cf /etc/postfix/main.cf.default
COPY --chmod=700 run.sh /

EXPOSE 25

ENV HOSTNAME mail.example.com

ENV DOMAINS example.com
ENV FORWARD1 @example.com myaddress@gmail.com

CMD /run.sh
