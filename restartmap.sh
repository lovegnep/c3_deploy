#!/bin/bash

# 要杀掉的进程名列表
procs=("MapServer")

for p in "${procs[@]}"; do
    pids=$(pgrep -f "$p")
    if [ -n "$pids" ]; then
        echo "Killing $p (PID: $pids)"
        kill -9 $pids
    else
        echo "Process $p not found"
    fi
done

cd /home/khan3/MAP/Server/
./MapServer &
