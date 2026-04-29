#!/bin/bash
yum update -y
yum install -y httpd

systemctl start httpd
systemctl enable httpd

echo "<h1>Hola mundo desde $(hostname -f)</h1>" > /var/www/html/index.html

echo "OK" | sudo tee /var/www/html/health

chown apache:apache /var/www/html/health
systemctl restart httpd