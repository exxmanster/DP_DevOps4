um update -y && yum install -y httpd
systemctl start httpd && systemctl enable httpd
echo "<h1>It's Alive and running from $(hostname -f)<h/1>" > /var/www/html/index.html
