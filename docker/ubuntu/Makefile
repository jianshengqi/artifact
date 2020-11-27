.PHONY: all
all: build
build:
	docker build -t ubuntu20 -f ubuntu20_04.dockerfile .
exec:
	docker run -it --rm --network=host ubuntu20 bash