.PHONY: all
all: build
build:
	docker build -t centos8 -f centos8.dockerfile .
exec:
	docker run -it --rm --network=host centos8 bash