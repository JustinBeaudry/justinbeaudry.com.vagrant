#!/bin/bash

BOLT_VERSION="0.0.8"
[ -f /usr/local/lib/bolt/VERSION ] && INSTALLED_BOLT_VERSION=$(cat /usr/local/lib/bolt/VERSION)

if [ "$BOLT_VERSION" != "$INSTALLED_BOLT_VERSION" ];then
  rm -rf /usr/local/lib/bolt /usr/local/bin/bolt
  curl -Ls https://github.com/diffsky/bolt/archive/$BOLT_VERSION.tar.gz > bolt-${BOLT_VERSION}.tar.gz
  tar xvzf bolt-${BOLT_VERSION}.tar.gz
  mv bolt-${BOLT_VERSION} /usr/local/lib/bolt
  ln -s /usr/local/lib/bolt/bin/bolt /usr/local/bin/bolt
fi

cat $(ls /etc/bolt/config/*.sh) > /etc/bolt/provision.sh

/usr/local/lib/bolt/bin/bolt satisfy /etc/bolt/provision.sh
