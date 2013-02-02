#! /bin/bash

for x in $(seq 10000) ; do
    echo -e "#$x - \033[0;33mcoucou\033[1;39m, Ceci est un test\033[0m"
done
