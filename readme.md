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
    qemu-img create -f qcow -o win7.qcow 16G

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
