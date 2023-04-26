FROM alpine

ENV SSMTP_SMTP_HOST smtp.example.com
ENV SSMTP_SMTP_PORT 587
ENV SSMTP_SMTP_AUTH_USER username
ENV SSMTP_SMTP_AUTH_PASS password

ENV SSMTP_MAIL_HOSTNAME $HOSTNAME
ENV SSMTP_MAIL_TO root@example.com
ENV SSMTP_MAIL_FROM root@example.com
ENV SSMTP_MAIL_REPLYTO $SSMTP_MAIL_FROM
ENV SSMTP_MAIL_SUBJECT Subject
ENV SSMTP_MAIL_BODY body

# Install requirements
RUN apk add ssmtp gettext

# Configure ssmtp
COPY ssmtp.conf.tpl /ssmtp.conf.tpl
RUN envsubst </ssmtp.conf.tpl >/etc/ssmtp/ssmtp.conf

# Send email and quit
COPY ssmtp.sh /ssmtp.sh
RUN chmod +x /ssmtp.sh
CMD /ssmtp.sh
