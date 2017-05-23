FROM golang:1.8

# File Author / Maintainer
MAINTAINER Andres Castaneda

# Install some tools: gcc build tools, unzip, etc
RUN \
	apt-get update && \
	apt-get -y upgrade && \
	apt-get -y install curl build-essential unzip pkg-config

# Install Libsodium
RUN \
	wget https://download.libsodium.org/libsodium/releases/libsodium-1.0.12.tar.gz && \
	mkdir /libsodium && \
	mv libsodium-1.0.12.tar.gz /libsodium/  && \
	cd /libsodium  && \
	tar -xvzf libsodium-1.0.12.tar.gz  && \
	cd libsodium-1.0.12/  && \
	./configure  && \
	make && make check  && \
	make install && ldconfig
