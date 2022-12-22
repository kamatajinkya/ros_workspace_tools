#! /bin/sh

set -e

SCRIPT_LOCATION=$(dirname $0)
SCRIPT_NAME=$(basename $0)

function usage()
{
    echo "Usage: ./$SCRIPT_NAME <project_repo> <target> " >& 2
    echo "Installs required dependencies and configures computer" >& 2
    echo "machine" >& 2
    echo "computer_type         Input main for now" >& 2
    echo "username              [Optional] User for which the computer has to be configured" >& 2
    echo "workspace_location    [Optional] Location of workspace" >& 2
}

if [ X"$1" == "--help" || X"$1" == "-h" ]; then
    usage
    exit
fi

PROJECT_REPO=${1:-$(usage; exit 22)}
TARGET=${2:-$(usage; exit 22)}

git clone $PROJECT_REPO .project
git clone git@github.com:biorobotics/ros_vscode.git .devcontainer
git clone git@github.com:biorobotics/ros_devcontainer.git .vscode
echo $TARGET > .target