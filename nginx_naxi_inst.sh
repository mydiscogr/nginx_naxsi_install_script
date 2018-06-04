#!/usr/bin/env bash

#echo "INSTALL LIBRARY"  
#apt-get install -y libpcre3 libpcre3-dev libssl-dev unzip make libgoogle-perftools-dev google-perftools jq gcc 
#apt install -y libxslt-dev  libgd2

mkdir ./ngxbuild

cd ./ngxbuild
latestNginx=$(curl -s http://hg.nginx.org/nginx/tags | grep "^ *release-" | head -1 | cut -c 9-)
latestNaxsi=$(curl -s https://api.github.com/repos/nbs-system/naxsi/releases | jq -r .[].tag_name | grep -v rc | head -1)

echo "GET BASIC FILES"
wget -q http://nginx.org/download/nginx-${latestNginx}.tar.gz
wget -q https://github.com/nbs-system/naxsi/archive/${latestNaxsi}.tar.gz

tar xzf nginx-${latestNginx}.tar.gz
tar xzf ${latestNaxsi}.tar.gz

echo "CONFIG"



echo "DOWNLOAD EXTRA MODULES"


cd nginx-1.14.0

./configure \
--user=www-data \
--group=www-data \
--prefix=/usr/local/nginx \
--sbin-path=/usr/sbin/nginx \
--conf-path=/etc/nginx/nginx.conf \
--http-log-path=/var/log/nginx/access.log \
--error-log-path=/var/log/nginx/error.log \
--lock-path=/var/lock/nginx.lock \
--pid-path=/run/nginx.pid \
--modules-path=/usr/lib/nginx/modules \
--http-client-body-temp-path=/var/lib/nginx/body \
--http-fastcgi-temp-path=/var/lib/nginx/fastcgi \
--http-proxy-temp-path=/var/lib/nginx/proxy \
--http-scgi-temp-path=/var/lib/nginx/scgi \
--http-uwsgi-temp-path=/var/lib/nginx/uwsgi \
--with-debug \
--with-pcre-jit \
--with-http_ssl_module \
--with-http_stub_status_module \
--with-http_realip_module \
--with-http_auth_request_module \
--with-http_v2_module \
--with-http_dav_module \
--with-http_slice_module \
--with-threads \
--with-http_addition_module \
--with-http_flv_module \
--with-http_geoip_module=dynamic \
--with-http_gunzip_module \
--with-http_gzip_static_module \
--with-http_image_filter_module=dynamic \
--with-http_mp4_module \
--with-http_perl_module=dynamic \
--with-http_random_index_module \
--with-http_secure_link_module \
--with-http_sub_module \
--with-http_xslt_module=dynamic \
--with-mail=dynamic \
--with-mail_ssl_module \
--with-stream=dynamic \
--with-stream_ssl_module \
--with-stream_ssl_preread_module \
--add-module=../naxsi-${latestNaxsi}/naxsi_src/ \
--add-module=../../extra-modules/headers-more-nginx-module-master

echo "type make then sudo make install "

sudo mkdir -p /var/lib/nginx

cd ./ngxbuild/nginx-1.14.0

#make
#make install
#--add-dynamic-module=/build/nginx-mcUg8N/nginx-1.14.0/debian/modules/http-headers-more-filter \
#--add-dynamic-module=/build/nginx-mcUg8N/nginx-1.14.0/debian/modules/http-auth-pam \
#--add-dynamic-module=/build/nginx-mcUg8N/nginx-1.14.0/debian/modules/http-cache-purge \
#--add-dynamic-module=/build/nginx-mcUg8N/nginx-1.14.0/debian/modules/http-dav-ext \
#--add-dynamic-module=/build/nginx-mcUg8N/nginx-1.14.0/debian/modules/http-ndk \
#--add-dynamic-module=/build/nginx-mcUg8N/nginx-1.14.0/debian/modules/http-echo \
#--add-dynamic-module=/build/nginx-mcUg8N/nginx-1.14.0/debian/modules/http-fancyindex \
#--add-dynamic-module=/build/nginx-mcUg8N/nginx-1.14.0/debian/modules/nchan \
#--add-dynamic-module=/build/nginx-mcUg8N/nginx-1.14.0/debian/modules/http-lua \
#--add-dynamic-module=/build/nginx-mcUg8N/nginx-1.14.0/debian/modules/rtmp \
#--add-dynamic-module=/build/nginx-mcUg8N/nginx-1.14.0/debian/modules/http-uploadprogress \
#--add-dynamic-module=/build/nginx-mcUg8N/nginx-1.14.0/debian/modules/http-upstream-fair \
#--add-dynamic-module=/build/nginx-mcUg8N/nginx-1.14.0/debian/modules/http-subs-filter


