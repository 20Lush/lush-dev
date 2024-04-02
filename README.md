# lush-dev
Debian based container for developing with my projects (without having to cross-compile to windows LOL)

# Usage
This repo's images are stored in the Github Container Registry! Use the command below to pull the image.
```sh
    docker pull ghcr.io/20lush/lush-dev:latest
```
The scripts I use to launch my containers and do some management are found in [this repository](https://github.com/20Lush/lush-dev) as well, though YMMV and I cannot guarantee for them to work everywhere.

There is no entrypoint built in from the Dockerfile, you will have to specify one if you are manually running a container from this image.

But if you are using my [start scripts(windows)](start_container.bat) you can just run:
```batch
   .\start_container.bat <OPTIONAL IMAGE SPEC>
```
And be off and away. This will put you into the root shell of the container and in the future will mount the current working directory once I iron out the details.