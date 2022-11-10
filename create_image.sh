#!/bin/bash

if [ ! -f input.img ]
then
  echo "Downloading raspios image ..."
  wget https://downloads.raspberrypi.org/raspios_lite_armhf/images/raspios_lite_armhf-2022-09-26/2022-09-22-raspios-bullseye-armhf-lite.img.xz
  unxz *.img.xz
  mv *.img input.img
fi

docker run --rm --privileged -v $PWD:/CustoPiZer/workspace -v $PWD/config.local:/CustoPiZer/config.local ghcr.io/octoprint/custopizer:latest
