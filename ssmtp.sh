#!/bin/sh

# configure ssmtp
envsubst </ssmtp.conf.tpl >/etc/ssmtp/ssmtp.conf

# prepare email
mailfile=$(mktemp)
trap "rm -f -- $mailfile" EXIT

cat >$mailfile <<EOF
From: $SSMTP_MAIL_FROM
To: $SSMTP_MAIL_TO
ReplyTo: $SSMTP_MAIL_REPLYTO
Subject: $SSMTP_MAIL_SUBJECT

$SSMTP_MAIL_BODY
EOF

# send
ssmtp -v $SSMTP_MAIL_TO <$mailfile
