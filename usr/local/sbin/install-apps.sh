#!/bin/bash

appsFile=/usr/local/etc/apps

editor "${appsFile}"
apt install < "${appsFile}"

