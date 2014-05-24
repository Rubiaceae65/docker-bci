# Docker image for computer brain interfaces

# Getting USB to work: docker run -t -i -privileged -v /dev/bus/usb:/dev/bus/usb bci bash

FROM debian
MAINTAINER Mathijs de Bruin, mathijs@mathijsfietst.nl

# Update Debian
ADD sources.list /etc/apt/sources.list
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get clean

# JDK, Octave
RUN apt-get install -y default-jdk octave

# Common dependencies
RUN apt-get install -y git-core subversion build-essential wget cmake automake autoconf gfortran unzip

# Fetch and unzip OpenVIBE
RUN wget -nv http://openvibe.inria.fr/pub/src/openvibe-0.17.1-src.zip
RUN unzip openvibe-0.17.1-src.zip
WORKDIR openvibe-0.17.1-src/scripts

# Installing dependencies
RUN apt-get install sudo
# RUN apt-get install -y lua5.1-dev python-dev libexpat-dev libboost-all-dev libogre-dev libalut-dev libvorbis-dev libitpp-dev libeigen3-dev libgtk2.0-dev libcegui-mk2-dev
RUN ./linux-install_dependencies

# Building OpenVIBE
RUN ./linux-build

# Clean afterwards
RUN apt-get clean
