FROM lambci/lambda:build-python3.6

RUN yum install -y yum-utils rpmdevtools && \
    curl -o /tmp/glpk.rpm https://rpmfind.net/linux/opensuse/tumbleweed/repo/oss/i586/glpk-4.65-2.1.i586.rpm  && \
    curl -o /tmp/libglpk40.rpm https://rpmfind.net/linux/opensuse/tumbleweed/repo/oss/i586/libglpk40-4.65-2.1.i586.rpm  && \
    cd /tmp && \
    rpmdev-extract *rpm && \
    mkdir -p /var/task/{lib,bin}  && \
    /bin/cp /tmp/libglpk40-4.65-2.1.i586/usr/lib/libglpk.so.40 /var/task/lib/ && \
    /bin/cp /tmp/glpk-4.65-2.1.i586/usr/bin/glpsol /var/task/bin/ && \
    chown ec2-user: -R /var/task/ && \
    cd /var/task && \
    zip -r9 /tmp/glpk.zip *
