#!/bin/bash

 docker run -it --rm --net host --cpuset-cpus 0 --memory 512mb -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY -v $HOME/Downloads:/root/Downloads --device /dev/snd -v /dev/shm:/dev/shm --name chrome2 chrome
