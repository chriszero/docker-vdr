#!/bin/sh
# `/sbin/setuser memcache` runs the given command as the user `memcache`.
# If you omit that part, the command will be run as root.
export LANG="de_DE.UTF-8"

# We need to preseed the volumes, just copy new files, no overwrite
cp -a -v --no-clobber /etc/epgd/* /epgd/config
cp -a /etc/epgd/epg.dat /epgd/config
cp -a /etc/epgd/*.sql /epgd/config
cp -a /etc/epgd/*.py /epgd/config


exec /usr/local/bin/epgd -n -t -p /usr/local/lib/epgd/plugins -c /epgd/config
