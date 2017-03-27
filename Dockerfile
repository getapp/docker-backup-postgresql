FROM quay.io/getapp/docker-backup

MAINTAINER Boris Mikhaylov

ENV POSTGRESQL_VER 9.6

RUN apt-get update \
    && apt-get install -y software-properties-common python-software-properties apt-transport-https \
    && wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - \
    && add-apt-repository "deb https://apt.postgresql.org/pub/repos/apt/ jessie-pgdg main" \
    && apt-get update \
    && apt-get install -y postgresql-client-${POSTGRESQL_VER} \
    && apt-get autoremove -y -qq \
    && apt-get clean -qq
