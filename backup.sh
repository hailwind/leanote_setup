#!/bin/bash

#DUMP MONGODB.
ymd=$(date +'%Y%m%d')
today_dir="/data/backup/$ymd"
mkdir -p $today_dir
/opt/mongodb/bin/mongodump -d leanote -o $today_dir

#SYNC leanote files.
if [ ! -d /data/leanote ]; then
  mkdir -p /data/leanote
fi

SCRIPTPATH=$(cd "$(dirname "$0")"; pwd)
cd $SCRIPTPATH/..
/usr/bin/rsync -ar ./* /data/leanote/
