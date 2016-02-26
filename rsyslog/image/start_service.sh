#!/bin/sh
service rsyslog start
tail -f /var/log/user.log
