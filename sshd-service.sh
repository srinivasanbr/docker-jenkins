#!/bin/bash

function start_sshd()
{
    /usr/sbin/sshd -f /etc/ssh/sshd_config -D &
}
function sshd_status()
{
    echo "sshd status : "
    pgrep -a sshd
}
function re_start()
{
    a=`pgrep sshd`
    kill -9 $a
    /usr/sbin/sshd -f /etc/ssh/sshd_config -D &
}
function err()
{
    echo "sh /sshd-service.sh start | restart | status"
}

case $1 in
start)
    start_sshd
    ;;
restart)
    re_start
    ;;
status)
    sshd_status
    ;;
*)
    err
    ;;
esac
