# Build for AMD 64 platform
FROM --platform=linux/amd64 almalinux:8.7


# Update dnf (package manager)
RUN dnf update -y && dnf upgrade -y; yum clean all

# Install required packages
RUN dnf install ncurses wget which vim epel-release dnf-plugins-core net-tools gcc gcc-c++ kernel-devel openssh openssh-clients openssh-server passwd -y
RUN dnf update -y

# Change root password (to be able to ssh between nodes)
RUN echo 'root' | passwd --stdin root

# Install 
RUN rpm -i https://yum.puppet.com/puppet-release-el-8.noarch.rpm
RUN dnf update -y
RUN dnf install puppetserver puppet-agent -y

# Run Systemd inside container: https://developers.redhat.com/blog/2014/05/05/running-systemd-within-docker-container
ENV container docker
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in ; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done);

RUN rm -rf /lib/systemd/system/multi-user.target.wants/ \
    && rm -rf /etc/systemd/system/.wants/ \
    && rm -rf /lib/systemd/system/local-fs.target.wants/ \
    && rm -f /lib/systemd/system/sockets.target.wants/udev \
    && rm -f /lib/systemd/system/sockets.target.wants/initctl \
    && rm -rf /lib/systemd/system/basic.target.wants/ \
    && rm -f /lib/systemd/system/anaconda.target.wants/*

VOLUME [ "/sys/fs/cgroup" ]
CMD ["/usr/sbin/init"]
# End Run Systemd inside container