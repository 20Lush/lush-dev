FROM debian:bookworm-slim

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
        libpcsclite-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists

RUN cd /usr/src/googletest && \
    cmake . && \
    cmake --build . --target install

COPY container-scripts/setup.sh /setup.sh