FROM ubuntu:latest

RUN apt-get update
RUN apt-get install -y curl build-essential ca-certificates \
        gettext-base \
        libgd-dev \
        libgeoip-dev \
        libncurses5-dev \
        libperl-dev \
        libreadline-dev \
        libxslt1-dev \
        make \
        perl \
        unzip \
        zlib1g-dev \
        git



ENV OPENRESTY openresty-1.13.6.1
ENV OPENSSL openssl-1.0.2m
ENV PCRE pcre-8.40
ENV LUAROCKS luarocks-2.4.3

ADD download.sh /build/download.sh
RUN /build/download.sh

ADD install.sh /build/install.sh
RUN /build/install.sh
