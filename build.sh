#!/bin/bash

docker build -t oe .

docker run -it --mount type=bind,source=$(pwd),target=/openatvbuilder/openatv/ oe
