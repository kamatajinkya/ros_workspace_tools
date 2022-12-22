#! /bin/sh

set -e

SCRIPT_LOCATION=$(dirname $0)
SCRIPT_NAME=$(basename $0)

usage()
{
    echo "Usage: ./$SCRIPT_NAME username [uid] [gid]" >& 2
    echo "Creates new unix user with permissions required for wombat project" >& 2
    echo "machine" >& 2
    echo "username              Input main for now" >& 2
    echo "uid                   [Optional] User ID" >& 2
    echo "gid                   [Optional] Group ID" >& 2
}

if [ X"$1" = "--help" -o X"$1" = "-h" ]; then
    usage
    exit
fi

USERNAME=${1:-$(whoami)}
USER_UID=${2:-$(id -u $(USERNAME))}
USER_GID=${3:-$(id -g $(USERNAME))}

export DEBIAN_FRONTEND=noninteractive

apt update
apt install --no-install-recommends sudo

groupadd --gid $USER_GID $USERNAME
useradd --uid $USER_UID --gid $USER_GID -m $USERNAME
echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME
chmod 0440 /etc/sudoers.d/$USERNAME

su $USERNAME