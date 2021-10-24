FROM centos:7
LABEL maintainer="Graham Lillico"

ENV container docker

# Update packages to the latest version
RUN yum -y update \
&& yum clean all \
&& yum -y autoremove

# Configure systemd.
# See https://hub.docker.com/_/centos/ for details.
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;

# Install required packages.
# Remove packages that are nolonger requried.
# Clean the yum cache.
RUN yum makecache fast \
&& yum -y install \
deltarpm \
epel-release \
initscripts \
&& yum -y update \
&& yum -y install \
python \
python-pip \
sudo \
&& yum -y autoremove \
&& yum clean all \
&& rm -rf /var/cache/yum/*

# Install ansible.
RUN pip install ansible 'cryptography==3.3.2' 'jinja2<3.0.0' 'markupsafe<2.0.0' 'packaging<21.0' 'PyYAML<6.0' 'pyparsing<3.0.0'

# Create ansible directory and copy ansible inventory file.
RUN mkdir /etc/ansible
COPY hosts /etc/ansible/hosts

VOLUME [ "/sys/fs/cgroup" ]
CMD ["/usr/lib/systemd/systemd"]