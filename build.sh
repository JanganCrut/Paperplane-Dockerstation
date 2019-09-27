#!/usr/bin/env bash

exit_script()
{
echo "Build is dead, Jim!"
sendTG "Docker Image Build for Paperplane is dead, Jim!"
}

trap exit_script SIGINT SIGTERM

function sendTG() {
    curl -s "https://api.telegram.org/bot${TELEGRAM_TOKEN}/sendmessage" --data "text=${*}&chat_id=-1001372533112&parse_mode=Markdown"
}

sendTG "\`Docker image is being updated!\`"

docker build . -t raphielscape/paperplanebase:clearlinux
docker tag raphielscape/paperplanebase:clearlinux raphielscape/paperplanebase:clearlinux
echo "$OWO" | docker login -u raphielscape --password-stdin >/dev/null 2>&1
docker push raphielscape/paperplanebase

sendTG "@raphielscape \`I have pushed new images to docker\` %0A [Images are Here](https://hub.docker.com/r/raphielscape/paperplanebase)"