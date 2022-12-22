#! /bin/sh
set -e

SCRIPT_NAME=$(basename $0)

usage()
{
    echo "Usage: ./$SCRIPT_NAME target [username] [workspace_location]" >& 2
    echo "Installs dependencies for the repos" >& 2
    echo "workspace_location    [Optional] Location of workspace" >& 2
}

if [ X"$1" = "--help" -o X"$1" = "-h" ]; then
    usage
    exit
fi

WORKSPACE_PATH=${1:-$(pwd)}

export DEBIAN_FRONTEND=noninteractive

sudo cp -r tools/setup/requirements/rosdistro/rosdep /etc/ros
rosdep update
sudo apt update
rosdep install --from-paths src --ignore-src -r -y