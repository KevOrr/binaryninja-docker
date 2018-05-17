FROM ubuntu:rolling

ARG uid
ARG gid

RUN apt -y update && \
    apt -y upgrade && \
    apt install -y libgl1-mesa-glx libfontconfig1 libxrender1 libegl1-mesa libxi6 libnspr4 libsm6 unzip python libglib2.0 libdbus-1-3 sudo libpython2.7 git python-pip && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

RUN groupadd -g $gid app && \
    useradd -r -u $uid -g app -md /app app && \
    sudo -u app mkdir -p ~app/.binaryninja/plugins && \
    sudo -u app -H git clone https://github.com/hugsy/binja-retdec ~app/.binaryninja/plugins/binja-retdec && \
    sudo -u app -H pip install --user requests pygments

COPY BinaryNinja-personal.zip /tmp/binja.zip
COPY license.txt /tmp
RUN cd ~app && sudo -u app unzip /tmp/binja.zip && \
    mv /tmp/license.txt . && \
    chown app:app license.txt && \
    rm -rf /tmp/*

USER app:app
WORKDIR /app
ENTRYPOINT ["binaryninja/binaryninja"]
