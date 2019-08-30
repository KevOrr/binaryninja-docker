# Binary Ninja Docker Container

Based on `ubuntu:rolling`.

### Requirements

- [Docker](https://get.docker.com/)
- [docker-compose](https://docs.docker.com/compose/install/)
- Python 3
- Make sure your user belongs to the `docker` group

### Installation

1. Clone this repo somewhere
2. Place your `BinaryNinja.zip` or `BinaryNinja-personal.zip`, as well as `license.txt` inside this directory
3. Run `./update [uid [gid]]` (see `./update --help`). This will build a new container, which may take a while

That's it! Now you should have a docker image called `binja`. Now you
can run this container as `docker run --rm -e DISPLAY="$DISPLAY" -v /tmp/.X11-unix:/tmp/.X11-unix binja`

### Running

Since docker containers don't run in the same filesystem as our host, we need to
bind mount any files we want to open into the docker container. Included in
[binja](binja) is an example python script that can be run as a command.

    USAGE: ./binja [-h | --help] [--] [FILE]...

Also included is `binaryninja.desktop`, which can be placed in `~/.local/share/applications`.
