#!/bin/bash


wget http://myip.rba3.com/index.php -O - -o /dev/null | cut -d: -f 2 | cut -d\< -f 1 | grep '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}'
