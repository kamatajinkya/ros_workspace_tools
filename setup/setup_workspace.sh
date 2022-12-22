#! /bin/sh

set -e

SCRIPT_LOCATION=$(dirname $0)
SCRIPT_NAME=$(basename $0)

usage()
{
    echo "Usage: ./$SCRIPT_NAME target [username] [workspace_location]" >& 2
    echo "Sets up folder. Downloads all repos. Installs dependencies for the repos" >& 2
    echo "target                Input main for now" >& 2
    echo "workspace_location    [Optional] Location of workspace" >& 2
}

if [ X"$1" = "--help" -o X"$1" = "-h" ]; then
    usage
    exit
fi

TARGET=${1:-$(cat .target)}
WORKSPACE_PATH=${2:-$(pwd)}

mkdir -p $WORKSPACE_PATH
vcs import $WORKSPACE_PATH < $WORKSPACE_PATH/.project/targets/$TARGET.repos

$WORKSPACE_PATH/tools/setup/install_ros_dependencies.sh $WORKSPACE_PATH
