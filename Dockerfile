ARG DOCKER_RUBY_TAG
FROM ruby:${DOCKER_RUBY_TAG}

ARG APP_NAME=app
WORKDIR /usr/local/app/

RUN groupadd --system ${APP_NAME} \
  && useradd --system ${APP_NAME} --gid ${APP_NAME}

COPY --chown=${APP_NAME}:${APP_NAME} app/Gemfile* ./

RUN bundle install

COPY --chown=${APP_NAME}:${APP_NAME} app/* ./

USER ${APP_NAME}

CMD ["bundle", "exec", "ruby", "./app.rb"]
