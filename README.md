yankelscialom/ssmtp
==================
Send emails with `ssmtp` in docker through an external SMTP server.

[![Latest image](https://img.shields.io/docker/v/yankelscialom/ssmtp/latest)](https://hub.docker.com/r/yankelscialom/ssmtp/)

Build and publish image to hub.docker.com
---------------------------------------
Requires `GNUMake`. As an alternative, copy/paste the commands from the `Makefile`.
```
docker login
make build
make publish
```

The image's tag is based on the last git anotated tag (result of `git describe`). You can update it with:
```
git tag -a x.y.z -m"Version x.y.z"
```

Run ssmtp
---------

### Send one email and quit
```
docker run --rm \
  -e "SSMTP_SMTP_HOST=smtp.gmail.com" \
  -e "SSMTP_SMTP_AUTH_USER=john.doe@gmail.com" \
  -e "SSMTP_SMTP_AUTH_PASS=secret" \
  -e "SSMTP_MAIL_HOSTNAME=example.org" \
  -e "SSMTP_MAIL_TO=recipient@example.org" \
  -e "SSMTP_MAIL_FROM=sender@example.org" \
  -e "SSMTP_MAIL_SUBJECT=Good news everyone" \
  -e "SSMTP_MAIL_BODY=I've just found how to send an email :)" \
  yankelscialom/ssmtp
```
