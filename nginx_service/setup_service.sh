rm /etc/init.d/nginx
rm /lib/systemd/system/nginx.service
cp nginx /etc/init.d/
cp nginx.service /lib/systemd/system
update-rc.d nginx defaults
chmod +x /etc/init.d/nginx
chown root:root /etc/init.d/nginx
chown root:root /lib/systemd/system/nginx.service
ln -s /lib/systemd/system/nginx.service /etc/systemd/system/multi-user.target.wants/nginx.service
systemctl enable nginx.service
systemctl daemon-reload

