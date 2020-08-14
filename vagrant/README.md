#### Using `packer`

To build an Ubuntu 18.04 box for only the VirtualBox provider

```
$ cd ubuntu
$ packer build -only=virtualbox-iso ubuntu-20.04-amd64.json
$ packer build -only=virtualbox-iso ubuntu-18.04-amd64.json
```

```
$ ubuntu/focal:ubuntu-20.04-legacy-server-amd64.iso
# https://mirrors.tuna.tsinghua.edu.cn/ubuntu-cdimage/ubuntu-legacy-server/releases/20.04/release/ubuntu-20.04-legacy-server-amd64.iso

$ ubuntu/bionic:ubuntu-18.04.4-server-amd64.iso
# https://mirrors.tuna.tsinghua.edu.cn/ubuntu-cdimage/releases/18.04.4/release/ubuntu-18.04.4-server-amd64.iso
```
