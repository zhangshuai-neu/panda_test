#!/bin/sh

#硬盘镜像所在位置
DISKIMG=./win7_ide.qcow

qemu-system-x86_64 \
-smp 4 \
-m 2048 \
-drive file=${DISKIMG},if=ide \
--enable-kvm
