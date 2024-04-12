# Welcome to lush-dev!
### lush-dev is a Debian based container for developing with my projects. 
Relevant scripts are provided, supporting both Linux and Windows seperately just to make things harder on me but easier to use in the end.

# Usage
Using the dev container takes a little bit of work, but you'll only have to set it up once per machine. The only dependencies are **git** and **docker** which are availible on both Windows and Linux, and in both platforms are going to be run on the command line. Recommended to use `Powershell` on Windows.

## Getting the helper scripts
First lets pull this repo, we want the scripts!
```bash
git clone https://github.com/20Lush/lush-dev.git
```
This should create a directory in wherever your terminal is right now.

<details><summary markdown="span"><i>~!!!~ OPTIONAL Add startup scripts to your $PATH</i></summary>

## Setting up PATH variables for ease-of-access to the start scripts.
### Addding scripts Windows PATH
1) In the Windows search bar, type in `System environment variables` and click the result that talks about editing the so-called environment variables
2) Click the `Environment Variables` near the bottom of the dialogue
3) In the `System Variables` box on the bottom, scroll to find and double click the `Path` variable, it should open a new dialogue showing stuff already inside.
4) Click the `New` button and insert the directory containing the scripts from the repo you cloned above
    * It would be something like `C:\<blah>\<blah>\<blah>\lush-dev\host-scripts\windows`
5) Press OK on the dialogues till you're out.
6) You need to refresh your Windows Explorer now, which can be done by right clicking the `Windows Explorer` process in Task Manager, or simply by restarting your computer.    
    * Restarting your computer is safer, restarting WinExplr is faster.
7) You should now be able to call `start_lushdev.bat` anywhere on the command line! This will start the container in your current working directory (which should be a repo you are working in).

### Adding Scripts to Linux PATH
We're going to add a $PATH definition to your `.bashrc`. Use whatever command line text editor suits your fancy, I'm going to use `nano`
1) run `nano ~/.bashrc`
2) Scroll all the way down to the bottom
3) add `PATH=$PATH:/<blah>/<blah>/<blah>/lush-dev/host-scripts/linux`
    * Note we are appending this to your already existing path
4) Save and quit
5) run `source ~/.bashrc`
6) You should now be able to call `start_lushdev.sh` anywhere on the command line! This will start the container in your current working directory (which should be a repo you are working in).
***
</details>

### Pulling the container artifact, the thing you should use.
Now lets pull my development container...
```bash
docker pull ghcr.io/20lush/lush-dev:latest
```
For sanity checking, you might want to run `docker images` to make sure its all in there.

From then you can just run my start scripts either by adding them to PATH (see optional section) or by copying them into your base repo directory.