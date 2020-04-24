cat < /dev/stdin > /tmp/0
sed -i 's/\\0/\\@#0/g' /tmp/0
sed -i 's/\\n/\\@#n/g' /tmp/0
sudo nc -4 -l -p 80 -c 'echo -en "HTTP/1.0 200 OK\nContent-Type: text/text; charset=utf-8\n\n$(cat /tmp/0)" | sed "s/@#//g"' >/dev/null &
google-chrome --no-proxy-server "localhost" &> /dev/null &
