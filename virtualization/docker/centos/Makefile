.PHONY: all
all: build
build:
	docker build -t centos7 -f centos7.dockerfile .
exec:
	docker run -it --rm --network=host centos7 bash