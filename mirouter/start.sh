#!/bin/sh

V2RAY_PATH="/userdisk/data/v2ray_download/v2ray-linux-arm-v4.26.0/v2ray-linux-arm/"
SCRIPT_PATH="/userdisk/data/v2ray_download/v2ray_script/"
echo "cd ${SCRIPT_PATH}"
cd ${SCRIPT_PATH} 

echo "sh ipset.sh"
sh ipset.sh

echo "sh iptables-d.sh"
sh iptables-d.sh
echo "sh iptables.sh"
sh iptables.sh
echo ".${V2RAY_PATH}/v2ray --config v2ray_mirouter.json"
${V2RAY_PATH}/v2ray --config v2ray_mirouter.json
