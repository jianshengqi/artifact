FROM ubuntu:18.04

ARG ats=http://www-eu.apache.org/dist/trafficserver/trafficserver-8.0.8.tar.bz2

# Update the package repository
RUN set -x \
 && DEBIAN_FRONTEND=noninteractive apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y \
        curl \
        locales \
        build-essential \
        bzip2 \
        libssl-dev \
        libxml2 \
        libxml2-dev \
        libpcre3 \
        libpcre3-dev \
        tcl \
        tcl-dev \
        libboost-dev \
        dumb-init \
        vim \
    # Configure locale
 && export LANGUAGE=en_US.UTF-8 \
 && export LANG=en_US.UTF-8 \
 && export LC_ALL=en_US.UTF-8 \
 && locale-gen en_US.UTF-8 \
 && DEBIAN_FRONTEND=noninteractive dpkg-reconfigure locales \
    # Install TrafficServer
    # https://trafficserver.apache.org/downloads
    # http://www-eu.apache.org/dist/trafficserver
 && mkdir /tmp/trafficserver \
 && cd /tmp/trafficserver \
 && curl -L ${ats} | tar -xj --strip-components 1 \
 && ./configure --prefix=/opt/ats \
 && make install \
    # Clean-up
 && apt-get purge --auto-remove -y \
        curl \
        build-essential \
        bzip2 \
        libssl-dev \
        libxml2-dev \
        libpcre3-dev \
        tcl-dev \
        libboost-dev \
 && apt-get clean \
 && rm -rf /tmp/* /var/lib/apt/lists/*

EXPOSE 8080

ENTRYPOINT ["dumb-init"]
CMD ["traffic_manager", "--stdout"]