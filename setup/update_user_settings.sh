#! /bin/sh

echo "source /opt/ros/${ROS_DISTRO}/setup.bash" >> /home/$(whoami)/.bashrc
echo "source $(pwd)/install/setup.bash" >> /home/$(whoami)/.bashrc

cp -r setup/.colcon /home/$(whoami)/.colcon

cat setup/gitignore > /home/$(whoami)/.gitignore 
git config --global core.excludesfile /home/$(whoami)/.gitignore