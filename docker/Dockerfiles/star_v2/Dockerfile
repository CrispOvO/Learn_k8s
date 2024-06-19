FROM ubuntu_base:latest	
RUN apt-get update && apt-get -y install \	
telnet \	
gcc \
make \
net-tools \
iputils-ping \
iproute2 \
traceroute \
python3 \
python-minimal \
openssh-server \
g++ \
gawk \
libncurses5-dev \
libreadline6-dev \
autoconf \
automake  \
libtool \
texinfo \
libsysfs-dev \
pkg-config \
tcpdump \
vim \
nload \
python-pip \
mariadb-server \
python3-pip \
curl
ADD quagga-1.2.4.tar.gz .
ADD c-ares-1.12.0.tar.gz .
ADD iperf-3.1.3-source.tar.gz .
ADD instance /instance/
ADD collect /collect/
COPY getip.py .
COPY router_config.py .
COPY Satellite.py .
COPY activate.py .
COPY modify_area.py .
COPY saveTable.sh /root/saveTable.sh
COPY init_conf.sh /root/init_conf.sh
COPY delTable.sh /root/delTable.sh
COPY saveNode.sh /root/saveNode.sh
COPY OSPF /root/ospf/
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config \
&& mkdir /var/run/sshd \
&& echo "root:root" | chpasswd \
&& echo "root   ALL=(ALL)   ALL" >> /etc/sudoers
WORKDIR /c-ares-1.12.0 
RUN ./configure && make && make install
WORKDIR /quagga-1.2.4
RUN ./configure --enable-ipv6 --enable-zebra --enable-ripd --enable-ripngd \
--enable-ospfd --enable-ospf6d --enable-bgpd --enable-netlink \
--enable-isisd --enable-multipath=0 --enable-rtadv --enable-gcc-rdynamic \
--enable-backtrace --enable-vtysh --enable-user=root \
--enable-group=root --enable-vty-group=root \
&& make \
&& make install
WORKDIR /usr/local/lib
RUN cp libzebra.* /lib \
&& cp libospf.* /lib \
&& rm libzebra* libospf.*
WORKDIR /
RUN cp /usr/local/etc/zebra.conf.sample /usr/local/etc/zebra.conf \
&& cp /usr/local/etc/ospfd.conf.sample /usr/local/etc/ospfd.conf \
&& cp /usr/local/etc/bgpd.conf.sample /usr/local/etc/bgpd.conf \
&& cp /usr/local/etc/ripd.conf.sample /usr/local/etc/ripd.conf \
&& echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf	\
&& echo "net.ipv4.conf.default.rp_filter=0" >> /etc/sysctl.conf \
&& echo "net.ipv4.conf.all.rp_filter=0" >> /etc/sysctl.conf \
&& echo "net.ipv4.conf.all.send_redirects = 1" >> /etc/sysctl.conf \
&& echo "net.ipv4.conf.all.accept_source_route = 1" >> /etc/sysctl.conf \
&& echo "net.ipv6.conf.all.accept_source_route = 1" >> /etc/sysctl.conf \
&& sysctl -p \
&& pip install --upgrade pip==20.3 -i https://pypi.tuna.tsinghua.edu.cn/simple/ --trusted-host pypi.tuna.tsinghua.edu.cn \
&& pip install -i https://pypi.tuna.tsinghua.edu.cn/simple/ --trusted-host pypi.tuna.tsinghua.edu.cn netifaces \
&& pip install -i https://pypi.tuna.tsinghua.edu.cn/simple/ --trusted-host pypi.tuna.tsinghua.edu.cn pexpect \
&& pip install -i https://pypi.tuna.tsinghua.edu.cn/simple/ --trusted-host pypi.tuna.tsinghua.edu.cn scapy \
&& pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple/ --trusted-host pypi.tuna.tsinghua.edu.cn pymysql \
&& pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple/ --trusted-host pypi.tuna.tsinghua.edu.cn flask \
&& echo "Asia/Shanghai" > /etc/timezone
WORKDIR /iperf-3.1.3
RUN ./configure && make && make install && ldconfig
WORKDIR /
EXPOSE 22
CMD sh /root/init_conf.sh; /bin/bash
