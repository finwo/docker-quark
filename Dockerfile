FROM alpine:edge
RUN echo "https://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
RUN apk update
RUN apk add quark
RUN mkdir -p /srv/www
EXPOSE 5000
ENTRYPOINT ["/usr/bin/quark"]
CMD ["-h", "0.0.0.0", "-p", "5000", "-d", "/srv/www"]
