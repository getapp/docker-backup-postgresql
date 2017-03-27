FROM quay.io/getapp/docker-backup

MAINTAINER Boris Mikhaylov

RUN apt-get update \
    && apt-get install -y postgresql-client \
    && apt-get autoremove -y -qq \
    && apt-get clean -qq
