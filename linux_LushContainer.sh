#!/bin/bash

image=ghcr.io/20lush/lush-dev:latest
mountdir=${PWD}
entrypoint_script="/setup.sh"
autoupdate=1

while getopts 'up:hr' flag; do
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
            echo "[HELP] -u Dont check for new container version    ..  ex. start_container.bat -u"
            echo "[HELP] -p Specifically set a path to mount    ......  ex. start_container.bat -p '~/Documents'"
            echo "[HELP] -h Help, usage information     ..............  ex. start_container.bat -h"
            ;;
        r)
            echo "[INFO] Logging into container as root..."
            entrypoint_script="/bin/bash"
    esac
done

if [ $autoupdate -eq 1 ]; then
    echo "[INFO] Checking latest dev container..."
    docker pull -q ghcr.io/20lush/lush-dev:latest
fi

echo "[INFO] Starting container with image: ${image} at ${mountdir}"
docker run  -it \
            --rm \
            --network="host" \
            -v ${mountdir}:/repo \
            --entrypoint ${entrypoint_script} \
            ${image}