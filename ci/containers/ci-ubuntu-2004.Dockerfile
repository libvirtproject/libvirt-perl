# THIS FILE WAS AUTO-GENERATED
#
#  $ lcitool dockerfile ubuntu-2004 libvirt+minimal,libvirt-perl
#
# https://gitlab.com/libvirt/libvirt-ci/-/commit/b098ec6631a85880f818f2dd25c437d509e53680
FROM docker.io/library/ubuntu:20.04

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y eatmydata && \
    eatmydata apt-get dist-upgrade -y && \
    eatmydata apt-get install --no-install-recommends -y \
            ca-certificates \
            ccache \
            gcc \
            gettext \
            git \
            libc-dev-bin \
            libc6-dev \
            libcpan-changes-perl \
            libglib2.0-dev \
            libgnutls28-dev \
            libmodule-build-perl \
            libnl-3-dev \
            libnl-route-3-dev \
            libtest-pod-coverage-perl \
            libtest-pod-perl \
            libtime-hr-perl \
            libtirpc-dev \
            libxml-xpath-perl \
            libxml2-dev \
            libxml2-utils \
            locales \
            make \
            ninja-build \
            perl \
            pkgconf \
            python3 \
            python3-docutils \
            python3-pip \
            python3-setuptools \
            python3-wheel \
            xsltproc && \
    eatmydata apt-get autoremove -y && \
    eatmydata apt-get autoclean -y && \
    sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
    dpkg-reconfigure locales && \
    dpkg-query --showformat '${Package}_${Version}_${Architecture}\n' --show > /packages.txt && \
    mkdir -p /usr/libexec/ccache-wrappers && \
    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/cc && \
    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/$(basename /usr/bin/gcc)

RUN pip3 install \
         meson==0.54.0

ENV LANG "en_US.UTF-8"
ENV MAKE "/usr/bin/make"
ENV NINJA "/usr/bin/ninja"
ENV PYTHON "/usr/bin/python3"
ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
