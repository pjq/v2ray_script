#!/bin/sh
#./control.sh start
#./control.sh stop

V2RAY_PATH="/userdisk/data/v2ray/v2ray-linux-arm-v4.26.0/v2ray-linux-arm/"
SCRIPT_PATH="/userdisk/data/v2ray/mirouter/"

COMMAND="$1"
DATE=`date`

stop() {
    echo "Stop v2ray..."
    echo "cd ${SCRIPT_PATH}"
    cd ${SCRIPT_PATH} 
    echo "sh iptables-d.sh"
    sh iptables-d.sh
    echo "pkill v2ray"
    pkill v2ray
}

start() {
    echo "Start v2ray..."
    echo "Run script ${DATE} " >> ${SCRIPT_PATH}/log
    echo "cd ${SCRIPT_PATH}"
    cd ${SCRIPT_PATH} 

    echo "sh ipset.sh"
    sh ipset.sh

    echo "sh iptables-d.sh"
    sh iptables-d.sh
    echo "sh iptables.sh"
    sh iptables.sh
    for i in {1..100}
    do
        echo "${V2RAY_PATH}/v2ray --config v2ray_mirouter.json"
        echo "Run v2ray ${DATE} " >> ${SCRIPT_PATH}/log
        ${V2RAY_PATH}/v2ray --config v2ray_mirouter.json
    done
}

case ${COMMAND} in
    start) start;;
    stop) stop;;
    *) echo "Wrong Command\nUsage: $0 start|stop";;
esac
