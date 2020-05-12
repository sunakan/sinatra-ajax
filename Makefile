export DOCKER_RUBY_TAG=2.7-slim
export APP_NAME=sinatra-ajax

build:
	docker build ./ \
		--build-arg DOCKER_RUBY_TAG=${DOCKER_RUBY_TAG} \
		--tag ${APP_NAME}:latest

bash:
	docker run \
		--rm \
		--tty \
		--interactive \
		--name ${APP_NAME} \
		--publish 4567:4567 \
		--user `id -u`:`id -g` \
		--mount type=bind,source=${PWD}/app/,target=/usr/local/app/ \
		${APP_NAME}:latest bash

up:
	docker run \
		--rm \
		--tty \
		--interactive \
		--name ${APP_NAME} \
		--publish 4567:4567 \
		${APP_NAME}:latest

clean:
	docker container ls --quiet --filter 'name=${APP_NAME}' | xargs -I {} docker container stop {}
