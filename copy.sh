#!/bin/sh
cd `dirname $0`
for wdir in `ls -d /usr/local/app/tars/tarsnode/data/*RoomServer/bin/so`
do
	# echo $wdir
	rm -vf ${wdir}/*.so
	cp -vf ./build/*.so ${wdir}
done