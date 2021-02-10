FROM centos:7
ENV container docker
RUN yum -y update; yum clean all
RUN yum -y install systemd; yum clean all
CMD [“/usr/sbin/init”]
VOLUME [ “/sys/fs/cgroup” ]
RUN yum -y install sudo
RUN sudo yum install openssh-server -y && sudo systemctl enable sshd
RUN useradd -rm -s /bin/bash -g root -u 1000 test
RUN echo ‘root:test123’
EXPOSE 22
CMD [“/usr/sbin/sshd”,“-D”]
VOLUME [ “/sys/fs/cgroup” ]
