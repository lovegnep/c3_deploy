#!/bin/bash

# 要杀掉的进程名列表
procs=("billing" "DBCenter" "DBShare" "GLServer" "MapServer" "LoginCenter")

for p in "${procs[@]}"; do
    pids=$(pgrep -f "$p")
    if [ -n "$pids" ]; then
        echo "Killing $p (PID: $pids)"
        kill -9 $pids
    else
        echo "Process $p not found"
    fi
done

