FROM centos

RUN yum install -y yum-utils wget bash-completion java openssh-server openssh-clients initscripts && \
    yum config-manager --add-repo=http://pkg.jenkins.io/redhat-stable/jenkins.repo &&\
    rpm --import http://pkg.jenkins.io/redhat-stable/jenkins.io.key &&\
    yum install -y jenkins && \
    yum clean all

COPY ["sshd-service.sh", "init.sh", "/"]

RUN mkdir /var/run/sshd &&\
    ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''  && \
    chmod 755 /init.sh &&\
    chmod 755 /sshd-service.sh

EXPOSE 8080 22

ENTRYPOINT ["/init.sh"]
