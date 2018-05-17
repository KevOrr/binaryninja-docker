# Binary Ninja Docker Container

Based on `ubuntu:rolling`.

### Requirements

- [Docker](https://get.docker.com/)
- [docker-compose](https://docs.docker.com/compose/install/)
- Python 3
- Make sure your user belongs to the `docker` group

### Installation

1. Clone this repo somewhere
2. `cd` into this directory
3. Place your `BinaryNinja-personal.zip` and `license.txt` here
4. Edit `docker-compose.yml` so that `uid` and `gid` match your user
5. Run `./update`. This will build a new container, which may take a while
6. Open `license.txt` when prompted
7. Close Binary Ninja

That's it! Now you should have a docker image called `binja_licensed`. Now you
can run this container as `docker run --rm -e DISPLAY="$DISPLAY" -v /tmp/.X11-unix:/tmp/.X11-unix binja_licensed`

### Running

Since docker containers don't run in the same filesystem as our host, we need to
bind mount any files we want to open into the docker container. Included in
[binja](binja) is an example python script that can be run as a command.

    USAGE: ./binja [-h | --help] [--] [FILE]...

Also included is `binaryninja.desktop`.
