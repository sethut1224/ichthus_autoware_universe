#!/bin/bash

IMAGE=$1
XSOCK=/tmp/.X11-unix
XAUTH=$HOME/.Xauthority
SHARED_DOCK_DIR=/root/shared_dir
SHARED_HOST_DIR=$HOME/shared_dir

USER_ID=1000

VOLUMES="--volume=$XSOCK:$XSOCK:ro	 
	 --volume=$SHARED_HOST_DIR:$SHARED_DOCK_DIR:rw
	 --volume=/tmp/.X11-unix:/tmp/.X11-unix:ro
	 --volume=/media:/media:rw
	 --volume=/dev/ttyUSB0:/dev/ttyUSB0:ro"
	 
ENVIRONS="--env DISPLAY=${DISPLAY}
	  --env NVIDIA_VISIBLE_DEVICES=all
	  --env NVIDIA_DRIVER_CAPABILITIES=all"

docker run \
	-it\
	--runtime=nvidia \
	$ENVIRONS \
	$VOLUMES \
	--privileged \
	--net=host \
	$RUNTIME \
	$IMAGE	  
	



