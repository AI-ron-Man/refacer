#!/bin/bash
docker stop -t 0 refacer-gpu
docker build . -f Dockerfile.gpu -t refacer-gpu
docker run -it --rm -p 7860:7860 --gpus all refacer-gpu