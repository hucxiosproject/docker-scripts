#!/bin/bash
source /data/env
eval "$(weave proxy-env)"

docker rm -f ghost
docker run --name ghost \
  -v /data/volumes/ghost:/data \
  -e VIRTHAL_HOST="$GHOST_VIRTUAL_HOST" \
  -e GHOST_URL="$GHOST_URL" \
  -e NODE_ENV="production" \
  -d ptimof/ghost
