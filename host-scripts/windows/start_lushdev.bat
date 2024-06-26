@echo off

SET IMGARG=ghcr.io/20lush/lush-dev:latest
SET MOUNTDIR=%cd%
SET ENTRYPOINT_SCRIPT=/setup.sh
SET "AUTOUPDATE=TRUE"

:loop
IF NOT "%1"=="" (
    IF "%1"=="-u" (
        echo [INFO] Wont automatically update dev container image...
        SET "AUTOUPDATE=FALSE"
        SHIFT
    )
    IF "%1"=="-p" (
        echo [INFO] Setting containers volume mount path to %2
        SET MOUNTDIR=%2
        SHIFT
    )
    IF "%1"=="-h" (
        echo [HELP] -u Dont check for new container version    ..  ex. start_lushdev.bat -u
        echo [HELP] -p Specifically set a path to mount    ......  ex. start_lushdev.bat -p '~/Documents'
        echo [HELP] -h Help, usage information     ..............  ex. start_lushdev.bat -h
        exit 0
    )
    if "%1"=="-r" (
        echo [INFO] Logging into container as root...
        SET ENTRYPOINT_SCRIPT=/bin/bash
        SHIFT
    )
    SHIFT
    GOTO :loop
)

if "%AUTOUPDATE%"=="TRUE" (
    SET IMGARG=ghcr.io/20lush/lush-dev:latest
    echo [INFO] Checking latest dev container...
    docker pull -q ghcr.io/20lush/lush-dev:latest
)

@echo [INFO] Starting container with image: %IMGARG% at %MOUNTDIR%
docker run --gpus device=0 -it --rm -e "TERM=xterm-256color" -h "lush-dev" --network="host" -v %MOUNTDIR%:/repo --entrypoint %ENTRYPOINT_SCRIPT% %IMGARG%