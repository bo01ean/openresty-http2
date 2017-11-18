#!/bin/bash

mkdir -p /tmp/
cd /tmp

function downloadExtract {
  echo "Downloading $2"
  curl $1 -o $2 2>/dev/null
  echo "Extracting: $2"
  tar -xzf $2
}

downloadExtract https://www.openssl.org/source/$OPENSSL.tar.gz $OPENSSL.tar.gz

downloadExtract https://ftp.pcre.org/pub/pcre/$PCRE.tar.gz $PCRE.tar.gz

downloadExtract https://openresty.org/download/$OPENRESTY.tar.gz $OPENRESTY.tar.gz

downloadExtract http://luarocks.github.io/luarocks/releases/$LUAROCKS.tar.gz $LUAROCKS.tar.gz 
