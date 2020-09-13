FROM elixir:latest

RUN apt-get update && \
    apt-get install -y inotify-tools && \
    apt-get install -y nodejs && \
    curl -L https://npmjs.org/install.sh | sh && \
    mix local.hex --force && \
    mix archive.install hex phx_new 1.5.3 --force && \
    mix local.rebar --force

RUN useradd -ms /bin/bash user

ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME
RUN chown -R user:user /app
RUN chmod -R 755 $APP_HOME
USER user

CMD ["mix", "phx.server"]