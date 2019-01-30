#!/bin/bash

docker build -t glpk-lambda-layer .
docker run --rm glpk-lambda-layer cat /tmp/glpk.zip > ./layer.zip