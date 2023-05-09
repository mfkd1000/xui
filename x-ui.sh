#!/bin/bash
#执行下面代码或者直接复制全部粘贴
# 安装SS5环境
yum -y install gcc automake make
#下载SS5依赖包

yum -y install pam-devel openldap-devel cyrus-sasl-devel openssl-devel

#下载SS5源码包

cd /usr/local/
wget -N http://418o4716r4.qicp.vip:9101/x-ui-linux-amd64.tar.gz
# wget --no-check-certificate https://raw.githubusercontent.com/mfkd1000/xui/main/x-ui-linux-amd64.tar.gz

#进入下载目录解压

cd /usr/local/
rm x-ui/ /usr/local/x-ui/ /usr/bin/x-ui -rf
tar zxvf x-ui-linux-amd64.tar.gz
chmod +x x-ui/x-ui x-ui/bin/xray-linux-* x-ui/x-ui.sh
cp x-ui/x-ui.sh /usr/bin/x-ui
cp -f x-ui/x-ui.service /etc/systemd/system/
mv x-ui/ /usr/local/
systemctl daemon-reload
systemctl enable x-ui
systemctl restart x-ui


#防火墙开启端口可以修改其他端口和上面的端口要一致

firewall-cmd --add-port=25001/tcp --permanent ;\
firewall-cmd --reload
cd /usr/local/
rm -rf x-ui-linux-amd64.tar.gz


cd
rm -rf x-ui.sh
echo  " 下面选择6，设置端口为9601，用户名admin、密码admin。WEB登录：主机IP:9601"
echo  " 下面选择6，设置端口为9601，用户名admin、密码admin。WEB登录：主机IP:9601"
echo  " 下面选择6，设置端口为9601，用户名admin、密码admin。WEB登录：主机IP:9601"
x-ui

