#!/bin/bash
#
#   Copyright (C) 2020 Liam Brannigan
#
#Target can be 'dev', 'lab' or 'app' to run with an open port for the notebook or streamlit apps
TARGET=$1
BUILD_TARGET=$1
if [ "${TARGET}" == "app" ]; then
  BUILD_TARGET=dev
fi

DOCKER_BUILDKIT=1 docker build -t mitgcm .

if [ "${TARGET}" == "dev" ]; then
docker run  -it --rm -v $(pwd):/app mitgcm:latest /bin/bash
fi

if [ "${TARGET}" == "lab" ]; then
docker run -it --rm -p 8891:8888  -v $(pwd):/usr/src/app mitgcm:latest /bin/bash
fi

if [ "${TARGET}" == "app" ]; then
docker run -p 8501:8501 -it --rm  -v $(pwd):/usr/src/app mitgcm:latest /bin/bash
fi
