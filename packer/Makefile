.PHONY: iso build

all: ubuntu
ubuntu: ubuntu-iso ubuntu-build
ubuntu-iso:
	cd ubuntu && axel -a -n 16 'https://mirrors.tuna.tsinghua.edu.cn/ubuntu-cdimage/ubuntu-legacy-server/releases/20.04/release/ubuntu-20.04.1-legacy-server-amd64.iso'
ubuntu-build:
	cd ubuntu && packer build -only=virtualbox-iso ubuntu-20.04-amd64.json