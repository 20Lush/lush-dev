@echo off

set img-arg=%1

if "%~1"=="" (
    set img-arg=ghcr.io/20lush/lush-dev:latest
)

@echo starting container with image: %img-arg%
docker run -it --rm %img-arg% bash