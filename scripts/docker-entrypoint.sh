#!/bin/bash
set -e

timestamp=$(date +%Y%m%d_%H%M%S)
jmeter_path=/mnt/jmeter

case $1 in
    master)
        tail -f /dev/null
        ;;
    server)
        $JMETER_HOME/bin/jmeter \
            -n -s \
            -Jclient.rmi.localport=7000 -Jserver.rmi.localport=60000
            -Jserver.rmi.ssl.disable=true \
            -j ${jmeter_path}/server/slave_${timestamp}_${IP_ADD:9:3}.log 
        ;;
    *)
        echo "Sorry, this option doesn't exist!"
        ;;
esac

exec "$@"
