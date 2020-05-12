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
		--publish 4567:4567 \
		--user `id -u`:`id -g` \
		--mount type=bind,source=${PWD}/app/,target=/usr/local/app/ \
		${APP_NAME}:latest bash
