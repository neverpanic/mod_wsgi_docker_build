FROM debian:jessie
MAINTAINER "Clemens Lang <cal@macports.org>"

# Install build dependencies of mod_wsgi
RUN ["sh", "-c", "sed -E 's/^deb /deb-src /g' /etc/apt/sources.list > /etc/apt/sources.list.d/deb-src.list"]
RUN ["apt-get", "-y", "update"]
RUN ["apt-get", "-y", "build-dep", "libapache2-mod-wsgi"]
RUN ["apt-get", "-y", "install", "git"]

WORKDIR "/usr/src"
COPY "build.sh" "/usr/src/build.sh"

ENTRYPOINT ["/bin/bash", "/usr/src/build.sh"]
CMD ["https://anonscm.debian.org/cgit/python-modules/packages/mod-wsgi.git", "debian/4.5.9-1"]
