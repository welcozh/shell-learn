#!/bin/bash

# 通过执行shell，实现从一个节点到其他节点的程序执行


#1 获取主机名，保存在yc1的~/.xhosts中
if [ -z $X_HOSTFILE ]; then
    X_HOSTFILE=~/.xhosts
fi

if [ ! -f $X_HOSTFILE ]; then
    echo "$X_HOSTFILE not found.. "
    exit -1
fi


#2 获取数据参数，保存在yc1的~/.xorbit中
if [ -z $X_ORBITFILE ]; then
    X_ORBITFILE=~/.xorbits
fi

if [ ! -f $X_ORBITFILE ]; then
    echo "$X_ORBITFILE not found.. "
    exit -1
fi

m=0
while read line;
do
    host[$m]=$line
    ((m+=1))
done < $X_HOSTFILE

n=0
while read line;
do
    orbit[$n]=$line
    ((n+=1))
done < $X_ORBITFILE


len1=${#host[@]}
len2=${#orbit[@]}

if [ "$len1"="$len2" ];
then
    echo "$len1 nodes..."
else
    echo "Please check the file: $X_HOSTFILE, $X_ORBITFILE"
    exit -1
fi

user=`whoami`

for ((i=0;i<1;i++));
do
    cmd="cd /home/$user/github/InSAR-optimization/InSAR; nohup sh main.sh /home/$user/data/${orbit[$i]} >/dev/null 2>&1 &"
    echo "-------------------------------------------"
    echo "Host ID: ${host[$i]} "
    echo "Data path: /home/$user/data/${orbit[$i]}" 
    echo "-------------------------------------------"
    echo 

    ssh $user@${host[$i]}<<EOF
        cd /home/$user/github/InSAR-optimization/InSAR
        nohup sh main.sh /home/$user/data/${orbit[$i]} >run.log 2>&1 &
        exit
EOF

done



