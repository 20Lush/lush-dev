#!/bin/bash
source /etc/profile

groupadd devs
adduser --disabled-password --gecos "" -q dev

su -l dev -P -c "cd /; /bin/bash"