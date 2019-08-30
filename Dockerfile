FROM ubuntu:rolling

ARG uid
ARG gid

RUN export DEBIAN_FRONTEND=noninteractive && \
  apt -y update && \
  apt -y upgrade && \
  apt install -y --no-install-recommends \
  # All of these are for Binar Ninja https://docs.binary.ninja/guide/troubleshooting/index.html#headless-ubuntu
    libgl1-mesa-glx \
    libfontconfig1 \
    libxrender1 \
    libegl1-mesa \
    libxi6 \
    libnspr4 \
    libsm6 \
    libglib2.0 \
    libpython2.7 \
  # Needed for libqxcb
    libdbus-1-3 \
    libxkbcommon-x11-0 \
  # Necessary to unzip Binary Ninja
    unzip \
  && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /tmp/*

RUN groupadd -g $gid app && \
    useradd -r -u $uid -g app -md /app app

COPY . /tmp/build
RUN /tmp/build/unzip-binja && \
    rm -rf /tmp/*

USER app:app
WORKDIR /app

ENTRYPOINT ["binaryninja/binaryninja"]
