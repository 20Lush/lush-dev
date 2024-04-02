@echo off

SET IMGARG=%1
SET CURRENTDIR=%cd%

if "%~1"=="" (
    SEt IMGARG=ghcr.io/20lush/lush-dev:latest
)

@echo starting container with image: %IMGARG% at %CURRENTDIR%
docker run -it --rm --net="host" -v %CURRENTDIR%:/repo %IMGARG% bash