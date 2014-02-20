# version 0.0.2
# docker-version 0.7.6
FROM        fedora

# We use a bootstrap script to avoid having temporary cache files and build
# dependencies being committed and included into the docker image.
ADD         bootstrap.sh /tmp/
RUN         chmod +x /tmp/bootstrap.sh && /tmp/bootstrap.sh

# don't need this because installing fedora znc packages
# handles it
#RUN         useradd znc

ADD         start-znc /usr/local/bin/
ADD         znc.conf.default /src/
RUN         chmod 644 /src/znc.conf.default
RUN         mkdir /znc-data
RUN         chown znc /znc-data

USER        znc
EXPOSE      6998
ENTRYPOINT  ["/usr/local/bin/start-znc"]
CMD         [""]
