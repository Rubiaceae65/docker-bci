# Docker image for computer brain interfaces

FROM debian
MAINTAINER Mathijs de Bruin, mathijs@mathijsfietst.nl

# Debian updates
RUN apt-get update

# Common dependencies
RUN apt-get install -y curl git

# Install buffer_bci using shell script from repo
RUN curl -s https://raw.githubusercontent.com/dokterbob/docker-bci/master/install_buffer_bci.sh | bash -x /dev/stdin
