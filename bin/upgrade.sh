#!/usr/bin/env sh

# This is supposed to be called on a susi device.
# It can be called remotely i.e. with
# ssh pi@susi.local /home/pi/SUSI.AI/susi_server/bin/upgrade.sh

cd `dirname $0`/..
echo "Loading latest code changes from download.susi.ai"
mkdir -p release
cd release
curl -sOL "http://download.susi.ai/susi_server/susi_server_binary_latest.tar.gz" 
echo "decompressing release"
tar xfz susi_server_binary_latest.tar.gz
cp -R susi_server_binary_latest/* ../
rm -Rf susi_server_binary_latest
rm susi_server_binary_latest.tar.gz
cd ..
echo "restarting susi"
bin/restart.sh
