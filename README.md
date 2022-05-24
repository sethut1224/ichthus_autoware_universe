# ichthus_autoware_universe

This repository was created to manage the source code of the **ICHTHUS autoware.universe**
It consist of the shell scripts for easy to installation, easy to pull latest autoware.universe source code.


# Files

Files
|file name  | description |
|--|--|
|external.repos  | external repository that enable ichthus autoware.universe and LGSVL simulator linkage |
|pub_engage_topic.sh | easy to publish engage topic when run the simple planning simulator|
|pull.sh| pull latest autoware.universe source code from autowarefoundation repository |
|run.sh | docker run script for autoware.universe public docker image |
|setup.sh | setup shell script to setup the ichthus autoware.universe environment for the first time (only once)|

## Environment Setting

#### 1. Create shared_dir for share the files between host to container 
* (host) $mkdir ~/shared_dir

#### 2. Clone this repository in the shared_dir
* (host) $ cd ~/shared_dir
* (host) $ git clone https://github.com/sethut1224/ichthus_autoware_universe.git
#### 3. Download and Run autowarefoundation's official autoware.universe docker image 
* (host) $ cd ~/shared_dir/ichthus_autoware_universe
* (host) $ ./run.sh ghcr.io/autowarefoundation/autoware-universe:latest
> (docker run without --rm option, docker container is persistent even if reboot the PC)
#### Now, you are in the docker container!


#### 4. Copy the scripts and repos file to autoware directory
- (container) $ cd /autoware
- (container) $ cp -r ~/shared_dir/ichthus_autoware_universe/* .

#### 5. Setup the ichthus autoware.universe
- (container) $ ./setup.sh (clone external packages)
- (container) $ ./pull.sh (pull latest source code from autowarefoundation)
#### 6. Build the ichthus autoware.universe
- (container) $ colcon build --symlink-install --cmake-args -DCMAKE_BUILD_TYPE=Release
- another build command
	- colcon build --symlink-install --cmake-args -DCMAKE_BUILD_TYPE=Release --packages-select <package_name>
	- colcon build --symlink-install --cmake-args -DCMAKE_BUILD_TYPE=Release --packages-up-to <package_name>

## How To Guides

**autowarefoundation official documentation** \
https://autowarefoundation.github.io/autoware-documentation/main/tutorials/


>For visualization, allow the docker user to access the x server\
> **(host) $ xhost +**

- **Error is occurred  if docker user can't access to x server**\
`Unable to init server: Could not connect: Connection refused*
Failed to parse arguments: Cannot open display`

\
\
**ichthus autoware.universe with LGSVL Simulator**\
(container) $ ros2 launch ichthus_launch ichthus_launch_taeho.launch.xml
(Todo..)
