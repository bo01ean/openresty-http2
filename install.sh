#!/bin/bash

mkdir -p /tmp/
cd /tmp

J=`cat /proc/cpuinfo | grep processor | wc -l`

######
# OpenSSL
######
cd /tmp/$OPENSSL

./config --prefix=/usr/local --openssldir=/usr/local shared
make -j$J
make install

######
# OpenResty
######
cd /tmp/$OPENRESTY
./configure -j$J \
  --with-file-aio \
  --with-openssl=/tmp/$OPENSSL \
  --with-http_v2_module \
  --with-pcre=/tmp/$PCRE \
  --with-pcre-jit \
  --with-stream \
  --with-stream_ssl_module \
  --with-ipv6 \
  --with-http_realip_module \
  --with-http_ssl_module \
  --with-http_stub_status_module \
  --with-threads

make -j$J
make install

######
# Luarocks
######
cd /tmp/$LUAROCKS
./configure \
  --lua-suffix=jit \
  --with-lua=/usr/local/openresty/luajit \
  --with-lua-include=/usr/local/openresty/luajit/include/luajit-2.1

make build
make install


#####
# kong
#####
luarocks install kong 0.11.1-0
