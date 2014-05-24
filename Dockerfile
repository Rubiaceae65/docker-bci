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
RUN apt-get install -y git-core subversion build-essential wget cmake automake autoconf gfortran

# Build OpenVIBE
RUN apt-get install -y unzip lua5.1-dev python-dev libexpat-dev libboost-all-dev libogre-dev libitpp-dev libeigen3-dev libgtk2.0-dev
RUN wget -nv http://openvibe.inria.fr/pub/src/openvibe-0.17.1-src.zip
RUN unzip openvibe-0.17.1-src.zip
RUN cd openvibe-0.17.1-src/scripts && ./linux-install_dependencies
RUN cd openvibe-0.17.1-src/scripts && ./linux-build

RUN apt-get clean
