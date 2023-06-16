FROM lambci/lambda:build-python3.6

RUN yum install -y yum-utils rpmdevtools --skip-broken && \
    curl -L -o /tmp/glpk.rpm http://rpmfind.net/linux/opensuse/tumbleweed/repo/oss/x86_64/glpk-5.0-1.14.x86_64.rpm  && \
    curl -L -o /tmp/libglpk40.rpm http://rpmfind.net/linux/opensuse/tumbleweed/repo/oss/x86_64/libglpk40-5.0-1.14.x86_64.rpm  && \
    cd /tmp && \
    rpmdev-extract *rpm && \
    mkdir -p /var/task/{lib,bin} && \
    /bin/cp /tmp/libglpk40-5.0-1.14.x86_64/usr/lib64/* /var/task/lib/ && \
    /bin/cp /tmp/glpk-5.0-1.14.x86_64/usr/bin/glpsol /var/task/bin/ && \
    chown ec2-user: -R /var/task/ && \
    cd /var/task && \
    zip -r9 /tmp/glpk.zip *
