FROM alpine:edge AS builder
RUN apk update
RUN apk add build-base git
RUN git clone git://git.suckless.org/quark /app
WORKDIR /app
RUN make

FROM alpine:edge AS runner
COPY --from=builder /app/quark /usr/bin/quark
COPY index.html /srv/www/index.html
EXPOSE 5000
ENTRYPOINT ["/usr/bin/quark"]
CMD ["-h", "0.0.0.0", "-p", "5000", "-d", "/srv/www"]
