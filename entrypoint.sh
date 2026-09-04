#!/bin/bash

# Clone the repo on first run
git clone https://github.com/Diskoteket/blog.git /blog
cd /blog

# Start zola in the background
zola serve --interface 0.0.0.0 --port 1111 --base-url localhost &

# Pull every 30 minutes and restart zola if there are changes
while true; do
        sleep 1800
        git fetch origin
        LOCAL=$(git rev-parse HEAD)
        REMOTE=$(git rev-parse origin/main)
        if [ "$LOCAL" != "$REMOTE" ]; then
                git pull
                pkill zola
                zola serve --interface 0.0.0.0 --port 1111 --base-url localhost &
        fi
done
