.PHONY: iso build

all: ubuntu centos
ubuntu: ubuntu-iso ubuntu-build
centos: centos-ios centos-build
ubuntu-iso:
	cd ubuntu && aria2c -x 16 'https://mirrors.tuna.tsinghua.edu.cn/ubuntu-cdimage/ubuntu-legacy-server/releases/20.04/release/ubuntu-20.04.1-legacy-server-amd64.iso'
	cd ubuntu && aria2c -x 16 'https://mirrors.tuna.tsinghua.edu.cn/ubuntu-cdimage/releases/18.04.4/release/ubuntu-18.04.5-server-amd64.iso'
ubuntu-build:
	cd ubuntu && packer build -only=virtualbox-iso ubuntu-20.04-amd64.json
	cd ubuntu && packer build -only=virtualbox-iso ubuntu-18.04-amd64.json
centos-iso:
	cd centos && aria2c -x 16 'https://mirrors.tuna.tsinghua.edu.cn/centos/8.2.2004/isos/x86_64/CentOS-8.2.2004-x86_64-dvd1.iso'
	cd centos && aria2c -x 16 'https://mirrors.tuna.tsinghua.edu.cn/centos/7.8.2003/isos/x86_64/CentOS-7-x86_64-DVD-2003.iso'
centos-build:
	cd centos && packer build -only=virtualbox-iso centos-8.2-x86_64.json
	cd centos && packer build -only=virtualbox-iso centos-7.8-x86_64.json