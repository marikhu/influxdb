FROM ubuntu:20.04

# Set Debian_frontend to avoid user interaction with tzdata

ARG DEBIAN_FRONTEND=noninteractive

RUN rm -rf /var/lib/apt/lists/

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y libssl-dev net-tools \
            make cmake g++ build-essential unzip zip \
            iputils-tracepath iproute2 iputils-ping \
            lsb-release \
            libboost-thread-dev libboost-python-dev \
            libboost-regex-dev \
            libyaml-cpp-dev libgtest-dev \
            wget unzip

RUN wget https://curl.se/download/curl-7.81.0.tar.gz && \
    tar xzf curl-7.81.0.tar.gz && \
    cd curl-7.81.0 && \
    ./configure --with-openssl && \
    make && \
    make install && \
    cd .. && \
    rm -rf curl-7.81.0.tar.gz curl-7.81.0

RUN apt-get install -y git vim ack

