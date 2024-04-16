#!/bin/bash
source /etc/profile

groupadd devs
adduser --disabled-password --gecos "" -q dev

su dev -P -c "cd /; /bin/bash"