#!/bin/bash
mkdir -p ./log
docker run --rm -p 7860:7860 --gpus all -v "`pwd`/diffusion_model":/app/models/ldm/stable-diffusion-v1/ -v "`pwd`/outputs":/app/outputs --name stable_diffusion --ipc host stable_diffusion 