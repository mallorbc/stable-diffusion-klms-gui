#!/bin/bash
docker run  -p 7680:7680 --gpus all -v `pwd`/diffusion_model:/app/models/ldm/stable-diffusion-v1/ --ipc host stable_diffusion 