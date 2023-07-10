#!/bin/bash
docker stop -t 0 refacer
docker build . --build-arg REQUIREMENTS_FILE=requirements.txt -t refacer
docker run -it --rm -p 7860:7860 refacer