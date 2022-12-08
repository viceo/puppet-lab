#!/bin/bash
. .env

# build master
echo "master image build start"
podman build -t "$MASTER_IMAGE" -f master.containerfile .

echo "master image build start"
podman build -t "$NODE01_IMAGE" -f node.containerfile .