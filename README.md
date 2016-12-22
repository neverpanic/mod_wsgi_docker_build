# Docker Container to build libapache2-mod-wsgi

This docker container builds a copy of libapache2-mod-wsgi from a specified
upstream repository of your choice for Debian Jessie.

## Building the Container
To build the container, run

```
docker build --tag "mod-wsgi-build:$(date +%Y-%m-%d)" .
```

## Running the Container
To run the container and build a copy of libapache2-mod-wsgi, run

```
docker run -it --rm "mod-wsgi-build:$build_tag"
```

where `$build_tag` is the version of the container you want to use. You can
optionally pass two arguments, the URL to a git repository to use and the tag
to build in this git repository.

The default source is [Debian's packaging](https://anonscm.debian.org/cgit/python-modules/packages/mod-wsgi.git/).
