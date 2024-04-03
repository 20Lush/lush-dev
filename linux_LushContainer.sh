#!/bin/sh

image=ghcr.io/20lush/lush-dev:latest
mountdir=${PWD}
autoupdate=1

while getopts 'up:h' flag; do
    case "${flag}" in
        u)
            echo "[INFO] Wont automatically update dev container image..."
            autoupdate=0
            ;;
        p)
            echo "[INFO] Setting containers volume mount path to ${OPTARG}"
            mountdir=${OPTARG}
            ;;
        h)
            echo "[HELP] -u Dont check for new container version .. ex. start_container.bat -u"
            echo "[HELP] -p Specifically set a path to mount .. ex. start_container.bat -p '~/Documents'"
            echo "[HELP] -h Help, usage information .. ex. start_container.bat -h"
            ;;
    esac
done

if [ $autoupdate -eq 1 ]; then
    echo "[INFO] Checking latest dev container..."
    docker pull -q ghcr.io/20lush/lush-dev:latest
fi

echo "[INFO] Starting container with image: ${image} at ${mountdir}"
docker run -it --rm --net="host" -v ${mountdir}:/repo ${image} bash