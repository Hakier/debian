#!/bin/bash

appsFile=/usr/local/etc/apps

echo 'deb http://deb.debian.org/debian/ bullseye main non-free contrib' > /etc/apt/sources.list.d/debian--non-free.list
apt update

editor "${appsFile}"
apt install $(cat "${appsFile}")

