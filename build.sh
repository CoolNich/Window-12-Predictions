#!/bin/bash
# Runs inside a debian:bookworm container. Builds a hybrid ISO with live-build.
set -euxo pipefail
apt-get update && apt-get install -y live-build
mkdir /build && cd /build
lb config --distribution bookworm --architectures amd64 \
  --binary-images iso-hybrid --debian-installer none \
  --archive-areas "main contrib non-free-firmware" \
  --apt-recommends false --memtest none \
  --bootappend-live "boot=live components quiet loglevel=3"
cp -r /src/config/. config/
chmod +x config/hooks/normal/*
lb build
cp /build/*.iso /src/windows12-os.iso
