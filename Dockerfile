FROM nvidia/cuda:12.4.1-devel-ubuntu22.04

LABEL maintainer Zachary Johnson "zachfsx83@gmail.com"

ENTRYPOINT [ "/bin/bash", "-c" ]

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        git \
        build-essential \
        clang-format \
        pkg-config \
        cmake \
        libgtest-dev \
        libgmock-dev \
        valgrind \
        net-tools \
        iputils-ping \
        wget \
        ca-certificates \
        nvidia-container-toolkit \
        libpcsclite-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists

RUN cd /usr/src/googletest && \
    cmake . && \
    cmake --build . --target install

ENV TERM=xterm-256color
ENV CUDA_HOME=/usr/local/cuda
ENV LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/cuda/lib64:/usr/local/cuda/extras/CUPTI/lib64
RUN echo 'PATH=$PATH:$CUDA_HOME/bin' >> /etc/bash.bashrc

COPY container-scripts/setup.sh /setup.sh