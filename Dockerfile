FROM alpine
RUN apk update && apk add --no-cache postfix
RUN echo "virtual_alias_maps = lmdb:/etc/postfix/virtual" >> /etc/postfix/main.cf
COPY --chmod=700 run.sh /

EXPOSE 25

ENV DOMAINS example.com
ENV FORWARD1 @example.com myaddress@gmail.com

CMD /run.sh
