#!/bin/bash
rm -rf /run/nologin
/sshd-service.sh start
/etc/init.d/jenkins start
dd if=/dev/zero of=/dev/null
