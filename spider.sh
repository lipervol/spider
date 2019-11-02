#!/bin/bash
echo "Spider Version 1.0"
echo "BY LPB"
echo "建议使用root用户运行"
echo "请输入网址："
read url
echo "为输出目录命名："
read list
mkdir $list
cd $list
wget $url -O index.url
sed 's/</\n/g' index.url | sed 's/>/\n/g' | grep img | grep src | sed 's/\"/\n/g' | sed "s0'0\n0g" | sed 's?//?\n?g' |grep -E 'jpg|jpeg|gif|png|bmp|tiff' | grep -v 'jpg.|gif.|png.|jpeg.|bmp.|tiff.'> picture.spider
for line in $(cat picture.spider)
do
	wget $line
done
rm picture.spider
rm index.url
ls | grep -E 'gif.|jpg.|jpeg.|png.|bmp.|tiff.' | xargs rm -f
num=$(ls -l | wc -l)
numall=`expr $num - 1`
apt install -y toilet
clear
toilet -f mono12 -F gay spider
ls
echo -e "\e[31;44;1m一共爬取了$numall张图片\e[0m"

