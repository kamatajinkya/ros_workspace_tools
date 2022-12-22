#! /bin/sh
set -e

apt update
cat setup/requirements/apt.txt | xargs sudo apt install -y
pip3 install -r setup/requirements/pip.txt
colcon mixin update
