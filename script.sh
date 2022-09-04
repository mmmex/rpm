#!/bin/bash
yum install -y rpm-build yum-utils
wget https://nginx.org/packages/centos/7/SRPMS/nginx-1.22.0-1.el7.ngx.src.rpm
rpm -i nginx-1.22.0-1.el7.ngx.src.rpm
yum-builddep -y /root/rpmbuild/SPECS/nginx.spec
rpmbuild -bb /root/rpmbuild/SPECS/nginx.spec
yum localinstall -y /root/rpmbuild/RPMS/x86_64/nginx-1.22.0-1.el8.ngx.x86_64.rpm
systemctl enable nginx
systemctl start nginx
yum install -y createrepo
mkdir /usr/share/nginx/html/repo
cp /root/rpmbuild/RPMS/x86_64/* /usr/share/nginx/html/repo/
createrepo /usr/share/nginx/html/repo/
sed -i '/index  index.html index.htm;/s/$/ \n\tautoindex on;/' /etc/nginx/conf.d/default.conf
systemctl reload nginx
cat >> /etc/yum.repos.d/local.repo << EOF
[local]
name=Local repo
baseurl=http://localhost/repo
gpgcheck=0
enabled=1
module_hotfixes=1
EOF
