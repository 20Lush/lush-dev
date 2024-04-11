#!/bin/bash
source /etc/profile

chmod -R a+rwx /repo

groupadd devs
adduser --disabled-password --gecos "" -q dev

su -l dev -P -c "cd /; /bin/bash"