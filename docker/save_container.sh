#!/bin/bash
docker_id=$(docker ps -aqf "name=^stable_diffusion$")
docker commit $docker_id stable_diffusion
