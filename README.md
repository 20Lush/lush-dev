# lush-dev
Debian based container for developing with my projects (without having to cross-compile to windows LOL). Relevant scripts are provided, supporting both Linux and Windows seperately just to make things harder on me but easier to use in the end.

# Quick start
First lets pull this repo, we want the scripts!
```bash
git clone https://github.com/20Lush/lush-dev.git
```
OPTIONALLY you can add `./lush-dev` to your path, now that its cloned. Doing so would allow you to call the start scripts from anywhere, and its a lot more ergonomic.

Now lets pull my development container...
```bash
docker pull ghcr.io/20lush/lush-dev:latest
```
For sanity checking, you might want to run `docker images` to make sure its all in there.

You can now call `start_container.bat`(windows) in any repository of mine and have everything set up you need to get stuff done and develop!

# Usage
This repo's images are stored in the Github Container Registry! Use the command below to pull the image.
```bash
    docker pull ghcr.io/20lush/lush-dev:latest
```
The scripts I use to launch my containers and do some management are found in [this repository](https://github.com/20Lush/lush-dev) as well, though YMMV and I cannot guarantee for them to work everywhere.

There is no entrypoint built in from the Dockerfile, you will have to specify one if you are manually running a container from this image.

But if you are using my [start scripts(windows)](start_container.bat) you can just run:
```bash
   .\start_container.bat <OPTIONAL IMAGE SPEC>
```
And be off and away. This will put you into the root shell of the container. It will mount the current directory it was called from in /repo/. So you'd want to clone the repo on host and call it in from there. If your host is windows, you might want to add this cloned repo to your PATH.