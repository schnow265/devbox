FROM ubuntu:jammy AS devbox-base-ubuntu

ARG NAME=devbox-ubuntu
ARG VERSION=jammy
LABEL com.github.containers.toolbox="true" \
    name="$NAME" \
    version="$VERSION" \
    usage="This image is meant to be used with the toolbox(1) command"
