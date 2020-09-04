.PHONY: iso build

all: iso
iso:
	aria2c 'https://mirrors.tuna.tsinghua.edu.cn/ubuntu-cdimage/ubuntu-legacy-server/releases/20.04/release/ubuntu-20.04-legacy-server-amd64.iso'
	aria2c 'https://mirrors.tuna.tsinghua.edu.cn/ubuntu-cdimage/releases/18.04.4/release/ubuntu-18.04.5-server-amd64.iso'
	aria2c 'https://mirrors.tuna.tsinghua.edu.cn/centos/8.2.2004/isos/x86_64/CentOS-8.2.2004-x86_64-dvd1.iso'
build:
	packer build -only=virtualbox-iso ubuntu-20.04-amd64.json
	packer build -only=virtualbox-iso ubuntu-18.04-amd64.json
	packer build -only=virtualbox-iso centos-8.2-x86_64.json