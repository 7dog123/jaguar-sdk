FROM ubuntu:18.04

LABEL maintainer="James Jones <atari@theinnocuous.com>"

COPY . /jaguar-sdk

RUN apt-get update && \
    apt-get install -y wget build-essential libusb-dev dosemu git

WORKDIR /jaguar-sdk

RUN git submodule update --init

RUN ./maketools.sh
RUN ./docker/cleanup_image.sh

RUN echo "\$_cpu_emu = \"full\"" >> ~/.dosemurc
RUN echo "source /jaguar-sdk/env.sh" >> ~/.bashrc
