FROM alpine
RUN apk update && apk add --no-cache postfix
COPY --chmod=700 run.sh /

EXPOSE 25

ENV FORWARDS=@example.com\ myaddress@gmail.com\
             test@other.com\ myaddress@gmail.com

CMD /run.sh
