FROM ubuntu:20.04 AS temporary

RUN mkdir /lab && touch /lab/test.txt

WORKDIR /lab