#!/bin/bash
# builds the docker image with an appropriate tag
set -euxo pipefail

tag="$(date +'%Y%m%d').$(git rev-parse --short HEAD)"

docker build \
  -t ternandsparrow/rstudio-server-conda:$tag .
