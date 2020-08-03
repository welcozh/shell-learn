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


for ((i=0;i<${#host[@]};i++));
do
    echo ${host[$i]}
    echo ${orbit[$i]}
done
