#!/bin/sh

V2RAY_PATH="/userdisk/data/v2ray_download/v2ray-linux-arm-v4.26.0/v2ray-linux-arm/"
SCRIPT_PATH="/userdisk/data/v2ray_download/v2ray_script/"
echo "cd ${SCRIPT_PATH}"
cd ${SCRIPT_PATH} 

echo "Stop the v2ray..."
echo "sh iptables-d.sh"
sh iptables-d.sh
echo "pkill v2ray"
pkill v2ray
