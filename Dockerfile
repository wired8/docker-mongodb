FROM dockerfile/mongodb
MAINTAINER Daniel Paschke <paschdan@wirkaufens.de>
# vim: set noexpandtab :

COPY docker-entrypoint.sh /entrypoint.sh
COPY scripts /tmp/scripts
ENTRYPOINT ["/entrypoint.sh"]
CMD ["mongod"]
