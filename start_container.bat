@echo off

SET IMGARG=ghcr.io/20lush/lush-dev:latest
SET MOUNTDIR=%cd%
SET "AUTOUPDATE=TRUE"

:loop
IF NOT "%1"=="" (
    IF "%1"=="-u" (
        echo [INFO] Wont automatically update dev container image
        SET "AUTOUPDATE=FALSE"
        SHIFT
    )
    IF "%1"=="-p" (
        echo [INFO] Setting containers volume mount path to %2
        SET MOUNTDIR=%2
        SHIFT
    )
    IF "%1"=="--help" (
        echo [HELP] -u Dont check for new container version .. ex. start_container.bat -u
        echo [HELP] -p Specifically set a path to mount .. ex. start_container.bat -p "~/Documents"
        echo [HELP] -h Help, usage information .. ex. start_container.bat -h
        exit 0
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
::docker run -it --rm --net="host" -v %CURRENTDIR%:/repo %IMGARG% bash