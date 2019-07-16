FROM sickrage/sickrage:9.4.138
MAINTAINER Dominique Barton

#
# Create user and group for SickRage.
#

RUN apk --no-cache add shadow \
    && addgroup -S -g 666 sickrage \
    && adduser -S -u 666 -g 666 -h /opt/sickrage sickrage

#
# Add SickRage init script.
#

ADD sickrage.sh /sickrage.sh
RUN chmod 755 /sickrage.sh

#
# Define container settings.
#

ENV ENV LANG en_GB.UTF-8
ENV LANGUAGE en_GB:en
ENV LC_ALL en_GB.UTF-8

VOLUME ["/datadir", "/media"]

EXPOSE 8081

#
# Start SickRage.
#

WORKDIR /opt/sickrage

ENTRYPOINT ["/sickrage.sh"]
