#!/bin/bash
docker stop -t 0 refacer-coreml
docker build . -f Dockerfile.coreml -t refacer-coreml
docker run -it --rm -p 7860:7860 refacer-coreml