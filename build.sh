#!/usr/bin/env bash
set -euo pipefail

trap 'exit 1' HUP INT QUIT TERM

SRC=${1:-https://anonscm.debian.org/cgit/python-modules/packages/mod-wsgi.git}
TAG=${2:-debian/4.5.9-1}

dir="mod_wsgi"
rm -rf "$dir"

# clone
git clone "$SRC" "$dir"
git -C "$dir" checkout "$TAG"

# and build
(cd "$dir" && dpkg-buildpackage -b -uc -m"Clemens Lang <cal@macports.org>")

echo "* Build finished successfully!"
echo "Generated artifacts are:"
ls -lash *.deb
echo "Copy them to your machine now and hit enter to terminate the container."
read
exit 0
