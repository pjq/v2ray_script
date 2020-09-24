#!/bin/sh
echo "Try to keep alive..."
pgrep start.sh| while read line; do echo -1000 > /proc/${line}/oom_score_adj; echo cat /proc/${line}/oom_*; done
pgrep v2ray| while read line; do echo -1000 > /proc/${line}/oom_score_adj;echo cat /proc/${line}/oom_*;  done
