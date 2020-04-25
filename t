#!/bin/bash

tmp=/tmp/text_http_chrome

cat < /dev/stdin > $tmp
sed -i 's/\\0/\\@#0/g' $tmp
sed -i 's/\\n/\\@#n/g' $tmp
sudo nc -4 -l -p 80 -c 'echo -en "HTTP/1.0 200 OK\nContent-Type: text/text; charset=utf-8\n\n$(cat /tmp/text_http_chrome)" | sed "s/@#//g"' >/dev/null &
google-chrome --no-proxy-server "localhost" &> /dev/null &

