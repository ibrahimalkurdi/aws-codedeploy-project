FROM debian:9

ENV DEBIAN_FRONTEND noninteractive

RUN echo "deb [check-valid-until=no] http://cdn-fastly.deb.debian.org/debian stretch main" > /etc/apt/sources.list.d/stretch.list
RUN sed -i '/deb http:\/\/deb.debian.org\/debian stretch-updates main/d' /etc/apt/sources.list
RUN apt-get -o Acquire::Check-Valid-Until=false update

RUN cp /bin/true /sbin/agetty
RUN rm -f /etc/ssh/ssh_host_rsa_key /etc/ssh/ssh_host_dsa_key

RUN apt-get install -yy systemd-sysv sudo lsb-release apt-utils locales initscripts python-netaddr
RUN apt-get install -yy openssh-client openssh-server
RUN apt-get install -yy ufw htop mc vim nano wget curl
RUN apt-get install -yy software-properties-common iftop net-tools
RUN apt-get install -yy vnstat git make tree inotify-tools apt-transport-https ca-certificates
RUN apt-get install -yy postfix bsd-mailx

