# MAINTAINER oatkrittin@gmail.com
FROM ubuntu:16.04

# Installation instructions: https://github.com/DReichLab/EIG

ENV SHAPEIT_HOME        /usr/local/shapeit
ENV SHAPEIT_VERSION     r904
ENV GLIBC_VERSION       v2.17
ENV PATH                $SHAPEIT_HOME/bin:$PATH

ENV TAR_GZ_FILE         shapeit.v2.$SHAPEIT_VERSION.glibc$GLIBC_VERSION.linux.tar.gz

RUN apt-get update && \
    apt-get install -y unzip wget && \
    wget https://mathgen.stats.ox.ac.uk/genetics_software/shapeit/$TAR_GZ_FILE && \
    mkdir -p $SHAPEIT_HOME && \
    tar -zxvf $TAR_GZ_FILE && \
    mv shapeit.*/* $SHAPEIT_HOME/. && \
    rm $TAR_GZ_FILE && \
    DEBIAN_FRONTEND=noninteractive apt-get autoremove -y unzip wget && \
    rm -rf /var/lib/apt/lists/*

# Clean data inside ./example
RUN rm -rf $SHAPEIT_HOME/example
