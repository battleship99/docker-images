#!/bin/bash

n=$(basename $0 .sh)
docker stop $n 
docker rm $n

docker run --name $n \
    --net host \
    -v $(pwd)/../:/host \
    -e GEN_CERT=yes  \
    --restart unless-stopped \
    -d fzinfz/anaconda3 \
    jupyter notebook  --ip=* --allow-root