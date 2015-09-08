FROM logicify/java8

MAINTAINER Alexander Beskrovny <@logicify.com>

WORKDIR /srv
USER app

ENV VERSION=2.0.3678

RUN curl -o upsource.zip -L  https://download.jetbrains.com/upsource/upsource-$VERSION.zip

RUN unzip upsource.zip

RUN rm -f upsource.zip

EXPOSE 8080

WORKDIR /srv/Upsource

RUN mkdir data

VOLUME ["/srv/Upsource/data", "/srv/Upsource/conf"]

CMD ["./bin/upsource.sh", "run"]

