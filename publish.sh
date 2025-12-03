#!/bin/sh
cd `dirname $0`
rm -vf /data/app/so/*.so
cp -vf ./build/*.so /data/app/so/
