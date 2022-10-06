#!/bin/bash
mkdir -p ./log
docker run --rm -p 7860:7860 --gpus all  -v `pwd`/log:/app/log --name stable_diffusion --ipc host stable_diffusion 
