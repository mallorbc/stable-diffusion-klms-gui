#!/bin/bash
dir_to_mount="$(pwd)"
docker run -d -p 7680:7680 --gpus all -v "$dir_to_mount":/workspace stable_diffusion