# Docker image for computer brain interfaces

# Getting USB to work: docker run -t -i -privileged -v /dev/bus/usb:/dev/bus/usb bci bash
# VERSION 2

FROM ubuntu:focal

# Update Debian
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get -y upgrade
#RUN apt-get clean

# JDK, Octave
RUN apt-get install -y default-jdk octave git sudo

# Common dependencies
RUN apt-get install -y git-core subversion build-essential wget cmake automake autoconf gfortran unzip

# Fetch and unzip OpenVIBE
RUN wget -nv http://openvibe.inria.fr/pub/src/openvibe-3.5.0-src.tar.xz
RUN tar -xJvf openvibe-3.5.0-src.tar.xz
#WORKDIR openvibe-3.0.0-src

# Installing dependencies
#RUN apt-get install sudo
# RUN apt-get install -y lua5.1-dev python-dev libexpat-dev libboost-all-dev libogre-dev libalut-dev libvorbis-dev libitpp-dev libeigen3-dev libgtk2.0-dev libcegui-mk2-dev
#RUN ls -lhtr 
WORKDIR openvibe-3.5.0-src
RUN ./install_dependencies.sh

# Building OpenVIBE
RUN apt-get install -y ninja-build
RUN ls -lhtr
#RUN cat build.sh
#RUN ./build.sh
#16 0.332 buildDirBase="${workDir}/build"
#16 0.332 dependenciesDir="${workDir}/dependencies"
#RUN export PATH=${dependenciesDir}/cmake/bin:$PATH ; generator=Ninja ; mkdir build
#WORKDIR build
RUN apt-get install -y libxerces-c-dev
#RUN PATH=${dependenciesDir}/cmake/bin:$PATH generator=Ninja cmake .. -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=dist/Release
RUN apt-get install -y expat libexpat1-dev
RUN apt-get install -y  libgtk-3-dev build-essential
#RUN PATH=${dependenciesDir}/cmake/bin:$PATH ninja install 
RUN apt-get install -y  libgtk2.0-dev  software-properties-common libexpat1-dev libncurses5-dev ninja-build libzzip-dev libxerces-c-dev libclang1-10 libllvm10 libncurses-dev libxapian30 libzzip-0-13   libglade2-0 libpython2-stdlib libpython2.7-minimal libpython2.7-stdlib libxml2-dev python2 python2-minimal python2.7 python2.7-minimal libalut0 libfftw3-bin libfftw3-long3 libfftw3-quad3 libfreeimage3 libgsl23 libgslcblas0 libilmbase24 libitpp8v5 libjxr0 libogg-dev libois-1.3.0v5 libopenal-data libopenal-dev libopenal1 libopenexr24 libpython2-dev libpython2.7 libpython2.7-dev libraw19 libsndio7.0 libsqlite0 libxmu-dev libxmu-headers libxpm-dev python-is-python2 python-pkg-resources python2-dev python2.7-dev sqlite3
RUN apt-get install -y wget automake  autoconf unzip gfortran libgsl-dev libreadline-dev libtool libxaw7-dev libpcre3-dev libfreeimage-dev libglu1-mesa-dev libalut-dev libvorbis-dev libois-dev libitpp-dev libsqlite0-dev libfftw3-dev	python-dev python-numpy sqlite vim
#lua5.1-dev python-dev libexpat-dev libboost-all-dev libogre-1.12-dev libalut-dev libvorbis-dev libitpp-dev libeigen3-dev libcegui-mk2-dev
RUN DEBIAN_FRONTEND=noninteractive ./install_dependencies.sh
RUN DEBIAN_FRONTEND=noninteractive ./build.sh



#RUN PATH=${dependenciesDir}/cmake/bin:$PATH ninja install 

# Clean afterwards
#RUN apt-get clean

# Fetch buffer_bci
#WORKDIR /

#RUN git clone https://github.com/jadref/buffer_bci.git

# Java
#WORKDIR /buffer_bci/dataAcq/buffer/java
#RUN ./build.sh

# C
#WORKDIR /buffer_bci/dataAcq/buffer/c
#RUN make
