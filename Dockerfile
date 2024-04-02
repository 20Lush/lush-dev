export DOCKER_BUILDKIT=1

from debian:bookworm-slim

MAINTAINER Zachary Johnson "zachfsx83@gmail.com"

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        git \
        build-essential \
        clang-format \
        pkg-config \
        cmake \
        libgtest-dev \
        valgrind \
        libpcsclite-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists

RUN cd /usr/src/googletest && \
    cmake . && \
    cmake --build . --target install
