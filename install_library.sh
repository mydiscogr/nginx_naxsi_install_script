#!/usr/bin/env bash

echo "INSTALL LIBRARY"  
apt install -y \
libpcre3 libpcre3-dev libssl-dev unzip make libgoogle-perftools-dev \
google-perftools jq gcc \
build-essential zlib1g-dev \
libxml2-dev libxslt-dev libgd-dev libgeoip-dev libperl-dev
