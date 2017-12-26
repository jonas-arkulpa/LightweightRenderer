FROM ubuntu:14.04

WORKDIR /opt/

RUN apt-get update && apt-get install -y --no-install-recommends \
        libglew-dev \
        libdevil-dev \
        libassimp-dev \
        freeglut3-dev \
        libpng3 \
        libpng-dev \
        libsysfs-dev \
        libudev-dev \
        build-essential \
        pkg-config \
        ca-certificates \
        git \
        wget && \
    wget ftp://ftp.freedesktop.org/pub/mesa/older-versions/11.x/11.0.7/mesa-11.0.7.tar.gz && \
    tar xvf mesa-11.0.7.tar.gz

WORKDIR mesa-11.0.7

RUN ./configure \
        --enable-osmesa \
        --disable-driglx-direct \
        --disable-dri \
        --disable-egl \
        --with-gallium-drivers=nouveau \
        --enable-glx-tls && \
    make -j20 && \
    make install

ENV LD_LIBRARY_PATH /usr/local/lib/

WORKDIR /opt/

RUN git clone -b feature/default-colors https://github.com/jonas-arkulpa/LightweightRenderer.git

WORKDIR LightweightRenderer

RUN rm -f render && make

ENV PATH /opt/LightweightRenderer:${PATH}

WORKDIR /workplace
