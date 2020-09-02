#!/usr/bin/env bash
docker build . -t raphielscape/paperplanebase:latest
docker tag raphielscape/paperplanebase:latest raphielscape/paperplanebase:latest
echo "$OWO" | docker login -u raphielscape --password-stdin >/dev/null 2>&1
docker push raphielscape/paperplanebase
