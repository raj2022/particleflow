#!/bin/bash

export LC_ALL=C.UTF-8
export LANG=C.UTF-8

echo "starting ray worker node"
mkdir -p "/mnt/ceph/users/ewulff/nvidia_smi_logs/$4_$2"
nvidia-smi --query-gpu=timestamp,name,pci.bus_id,driver_version,pstate,pcie.link.gen.max,pcie.link.gen.current,temperature.gpu,utilization.gpu,utilization.memory,memory.total,memory.free,memory.used --format=csv -l 1 -f "/mnt/ceph/users/ewulff/nvidia_smi_logs/$4_$2/worker_$3.csv" &
ray start --address $1
sleep infinity
