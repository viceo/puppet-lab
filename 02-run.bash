#!/bin/bash
. .env

echo "master container run"
podman run -itd \
    --rm --privileged \
    --hostname "$MASTER_CONTR" \
    --name "$MASTER_CONTR" "$MASTER_CONTR"

echo "node01 container run"
podman run -itd \
    --rm --privileged \
    --hostname "$NODE01_CONTR" \
    --name "$NODE01_CONTR" "$NODE01_CONTR"
