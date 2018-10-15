# Panda Test

Panda链接： git@github.com:mnavaki/FAROS.git

### 安装

    1）执行 panda/panda_install.bash
        自动处理了一些依赖包
    2）执行 panda/qemu/build.sh
        编译生成修改过的qemu

    notice：删除之前安装的llvm
        sudo xargs rm < install_manifest.txt

### 进行测试

1.创建win7镜像

	win7的硬盘文件：win7_ide.qcow
	最好使用virtual-box创建并安装，否则使用qemu。。。。超级慢，超级慢
	在使用virtual-box时，要创建qcow格式的硬盘文件，并且不能使用默认的sata接口，要使用ide接口
	安装完之后使用如下脚本，即可启动该硬盘文件

    脚本：
		#!/bin/sh
		#硬盘镜像所在位置
		DISKIMG=./win7_ide.qcow

		qemu-system-x86_64 \
		-smp 4 \
		-m 2048 \
		-drive file=${DISKIMG},if=ide \
		--enable-kvm

2.


    测试的例子：
    1 Record
        1.1 Start VM:
            $cd qemu/
            $sudo ./i386-softmmu/qemu-system-i386 -hda PATH_TO_VM_IMG/win7.qcow -m 1G --monitor stdio -netdev user,id=net0 -device e1000,netdev=net0 -vnc :1
        1.2 Start recording
            (qemu) begin_record record_name
        1.3 Stop recording
            (qemu) stop_record
        1.4 Exit QEMU
            (qemu) quit
    2 Replay
        2.1 Start VM
            $cd qemu/
            $sudo ./i386-softmmu/qemu-system-i386 -replay record_name -m 1G --monitor stdio -netdev user,id=net0 -device e1000,netdev=net0 -panda faros:pname=mal.exe
