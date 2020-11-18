#!/usr/bin/env bash

if [ "$(basename "$0")" = "run-aarch64.sh" ]; then
	CONTAINER_NAME="termux-aarch64"
	DOCKER_IMAGE_NAME="xeffyr/termux:aarch64"
else
	CONTAINER_NAME="termux-i686"
	DOCKER_IMAGE_NAME="xeffyr/termux:latest"
fi

docker start "$CONTAINER_NAME" > /dev/null 2> /dev/null || {
	echo "Creating new container..."
	docker run \
		--detach \
		--name "$CONTAINER_NAME" \
		--tty \
		"$DOCKER_IMAGE_NAME"
}

docker exec --interactive --tty "$CONTAINER_NAME" \
	/data/data/com.termux/files/usr/bin/login
