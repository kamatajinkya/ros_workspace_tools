FROM ros:humble

ARG USERNAME=ros
ARG USER_UID=1000
ARG USER_GID=$USER_UID
ARG WORKSPACE_PATH=/workspaces/workspace
ARG TARGET=main

COPY ./setup /setup/

RUN export DEBIAN_FRONTEND=noninteractive &&\
    /setup/create_user.sh $USERNAME $USER_UID $USER_GID &&\
    /setup/install_basic_tools.sh &&\
    /setup/update_user_settings.sh &&\
    rm -rf /setup &&\
    rm -rf /var/lib/apt/lists/*

ENV TARGET=$TARGET
USER $USERNAME