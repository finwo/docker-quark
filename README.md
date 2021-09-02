# Quick Reference

- Quark homepage: http://tools.suckless.org/quark/
- Package maintained By: [Robin Bron](https://github.com/finwo/docker-quark)
- Where to file issues: https://github.com/finwo/docker-quark/issues

## Quark

quark is an extremely small and simple HTTP GET/HEAD-only web server for static
content.

## How to use this image

This image installs quark into alpine:edge and configures it to serve documents
placed in `/srv/www`. Either extend this image and place your own files in there
or use this image as-is when mounting your files in that location.

Because quark does not support configuration files, the port of this image is
fixed to 5000.

The command in this image is as follows, should you want to change it:

```
ENTRYPOINT ["/usr/bin/quark"]
CMD ["-h", "0.0.0.0", "-p", "5000", "-d", "/srv/www"]
```

### Standalone

```
$ docker run -p 8080:5000 finwo/quark -v your-docroot:/srv/www
```

### docker-compose

```
services:
  mysql:
    image: finwo/quark
    restart: always
    networks:
      - default
    volumes:
      - your-docroot:/srv/www
    ports:
      - '8080:5000'
```
