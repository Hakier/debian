#!/bin/bash

echo 'fs.inotify.max_user_watches = 524288' >> /etc/sysctl.d/inotify-watches-limit.conf
sudo sysctl -p --system

echo 'Inotify watches limit increased'
echo -e '\nNow you should restart your IDE\n'

