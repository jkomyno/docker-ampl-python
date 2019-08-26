# Ubuntu version
ARG UBUNTU=18.04

FROM ubuntu:${UBUNTU} AS system
LABEL maintainer="alberto.schiabel@gmail.com"

# Update system dependencies
RUN apt-get update

# Install system utils
RUN apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        wget \
        bzip2 \
        git \
        && apt-get clean \
        && rm -rf /var/lib/apt-get/lists/* /tmp/* /var/tmp/*

# Python version
ARG PYTHON=3.6

# Install miniconda, ampl and other useful python modules
RUN cd /tmp && wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    && chmod +x Miniconda3-latest-Linux-x86_64.sh \
    && bash Miniconda3-latest-Linux-x86_64.sh -b -p /opt/miniconda \
    && rm Miniconda3-latest-Linux-x86_64.sh \
    && /opt/miniconda/bin/conda install python=${PYTHON} ipython -y \
    && /opt/miniconda/bin/conda clean --all -y

# AMPL location
# By default it's the free demo version for Linux 64bit
ARG AMPL=http://ampl.com/demo/ampl.linux64.tgz

# If ${AMPL} is a local compressed file, it will be automatically
# uncompressed into /opt by the ADD command.
# The script detect_ampl.sh tries to ensure that /opt/ampl
# will point to a directory containing the ampl binaries.
ADD ${AMPL} /opt
ADD ./detect_ampl.sh /opt
RUN chmod +x /opt/detect_ampl.sh
RUN /opt/detect_ampl.sh

# Add ampl and conda/python to the path
ENV PATH /opt/miniconda/bin:/opt/ampl:$PATH
ENV LANG C.UTF-8

# Set working directory
WORKDIR /app
