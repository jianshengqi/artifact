FROM centos:8

RUN set -ex \
    && rm -rf /etc/yum.repos.d/* \
    && curl -so /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-8.repo \
    && yum makecache \
    && yum install -y \
        vim \
        git \
    && yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm \
    && yum install -y ansible \
    && yum clean all
