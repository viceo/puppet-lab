#!/bin/bash
. .env

echo "master container stop"
podman stop "$MASTER_CONTR"

echo "node01 container stop"
podman stop "$NODE01_CONTR"