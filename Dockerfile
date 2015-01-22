FROM mongo

MAINTAINER Daniel Paschke <paschdan@wirkaufens.de>

ADD scripts /tmp/scripts
ADD docker-entrypoint.sh /entrypoint.sh

EXPOSE 28017
