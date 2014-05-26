docker-bci
==========

Docker image for computer brain interfaces.

Includes:
* OpenVIBE (Version 1)
* Octave
* JDK
* [buffer_bci](https://github.com/jadref/buffer_bci)

Docker image: https://index.docker.io/u/dokterbob/bci/

Getting started
---------------

1. [Install Docker](https://www.docker.io/gettingstarted/#h_installation)
2. Pull image:

       docker pull dokterbob/bci

3. Run shell inside image (with USB ports from system mapped through):

       docker run -t -i -privileged -v /dev/bus/usb:/dev/bus/usb bci bash
