#### Using `packer`

To build an vagrant box for only the VirtualBox provider

```
$ packer build -only=virtualbox-iso ubuntu-20.04-amd64.json
```

```
$ ubuntu/focal:ubuntu-20.04.1-legacy-server-amd64.iso
# https://mirrors.tuna.tsinghua.edu.cn/ubuntu-cdimage/ubuntu-legacy-server/releases/20.04/release/ubuntu-20.04.1-legacy-server-amd64.iso
```
