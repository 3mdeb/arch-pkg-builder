#!/bin/bash

docker run --rm -it \
-v $(dirname $SSH_AUTH_SOCK):$(dirname $SSH_AUTH_SOCK) -e SSH_AUTH_SOCK=$SSH_AUTH_SOCK  \
-v ${PWD}/pkg:/build \
3mdeb/arch-pkg-builder
