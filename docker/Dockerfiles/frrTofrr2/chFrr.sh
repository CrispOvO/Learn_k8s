#!/bin/bash

# echo "ripd/ospfd"
protocal=$1

# modify daemons file.
filePath="/etc/frr/daemons"
cat>${filePath}<<EOF
bgpd=no
ospfd=no
ospf6d=no
ripd=no
ripngd=no
isisd=no
pimd=no
pim6d=no
ldpd=no
nhrpd=no
eigrpd=no
babeld=no
sharpd=no
pbrd=no
bfdd=no
fabricd=no
vrrpd=no
pathd=no
EOF


sed -i "s/${protocal}=no/${protocal}=yes/g" ${filePath}

cat>>${filePath}<<EOF

vtysh_enable=yes
zebra_options="  -A 127.0.0.1 -s 90000000"
bgpd_options="   -A 127.0.0.1"
ospfd_options="  -A 127.0.0.1"
ospf6d_options=" -A ::1"
ripd_options="   -A 127.0.0.1"
ripngd_options=" -A ::1"
isisd_options="  -A 127.0.0.1"
pimd_options="   -A 127.0.0.1"
pim6d_options="  -A ::1"
ldpd_options="   -A 127.0.0.1"
nhrpd_options="  -A 127.0.0.1"
eigrpd_options=" -A 127.0.0.1"
babeld_options=" -A 127.0.0.1"
sharpd_options=" -A 127.0.0.1"
pbrd_options="   -A 127.0.0.1"
staticd_options="-A 127.0.0.1"
bfdd_options="   -A 127.0.0.1"
fabricd_options="-A 127.0.0.1"
vrrpd_options="  -A 127.0.0.1"
pathd_options="  -A 127.0.0.1"
EOF


# modify frr.conf file.
filePath="/etc/frr/frr.conf"
cat>${filePath}<<EOF
frr version 8.5.3
frr defaults traditional
log syslog informational
no ipv6 forwarding
service integrated-vtysh-config
EOF

# get ip
ips=(`hostname -I|tr '.' ' '`)
nets=()
len=${#ips[@]}
area=${ips[1]}
for ((i=0, j=0; i<len; i=i+4, j=j+1))
do
	tmp="${ips[i]}.${ips[i+1]}.${ips[i+2]}.0/24"
	nets[j]=$tmp
done

if [ $1=="ripd" ]; then
	echo "router rip" >> ${filePath}
	for((i=0;i<${#nets[@]};i++))
	do
		echo " network ${nets[i]}" >> ${filePath}
	done
fi

if [ $1=="ospfd" ]; then
	echo "router ospf" >> ${filePath}
	for((i=0;i<${#nets[@]};i++))
	do
		echo " network ${nets[i]} area ${area}" >> ${filePath}
	done
fi

# tail of file
cat>>${filePath}<<EOF
exit
!
end
EOF

service frr restart
