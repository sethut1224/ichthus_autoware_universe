echo alias cc="'cd /autoware && colcon build --symlink-install --cmake-args -DCMAKE_BUILD_TYPE=Release --packages-select'" >> ~/.bashrc
echo alias ccu="'cd /autoware && colcon build --symlink-install --cmake-args -DCMAKE_BUILD_TYPE=Release --packages-up-to'" >> ~/.bashrc
echo alias cca="'cd /autoware && colcon build --symlink-install --cmake-args -DCMAKE_BUILD_TYPE=Release'" >> ~/.bashrc

pip3 install pyserial
pip3 install transforms3d

sudo apt-get update -y
sudo apt-get install -y can-utils vim gnome-terminal

rm -rf /autoware/src/external/
rm -rf /autoware/src/universe/autoware.universe
rm -rf /autoware/src/drivers/

vcs import < ichthus.repos
. pull.sh

source ~/.bashrc

