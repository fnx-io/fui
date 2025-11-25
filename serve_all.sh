#!/bin/sh

tailwindcss -i ./fui/lib/css/fui.tw.css -o ./fui/lib/css/fui.css --watch=always < /dev/null &
tailwindcss -i ./fui-demo/web/demo.tw.css -o ./fui-demo/web/demo.css --watch=always < /dev/null &

cd fui-demo;

jaspr serve;

killall tailwindcss;
