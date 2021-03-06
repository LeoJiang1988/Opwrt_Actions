#!/bin/sh
clear
rm -rf ./artifact/
mkdir -p ./artifact/
mv friendlywrt-rk3328/out/*img* ./artifact/
cd ./artifact/
gzip *.img
zip R2S-tiny-$(date +%Y-%m-%d).zip *.img.gz
rm *.img.gz
echo "::set-env name=FIRMWARE::$PWD"
echo "::set-output name=status::success"
echo "::set-env name=DATE::$(date "+%Y-%m-%d %H:%M:%S")"
release_tag="NanoPi-R2S-${{ env.DATE }}-tiny"
echo "##[set-output name=release_tag;]$release_tag"
cd ../friendlywrt-rk3328/friendlywrt
cp .config ../../artifact/config-tiny-full
./scripts/diffconfig.sh > ../../artifact/config-tiny.seed
exit 0
