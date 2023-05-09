sudo su -c 'echo "#!/bin/bash
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd
echo \"<h1>Hello World from \$(hostname -f)</h1>\" > /var/www/html/index.html" > /install-web-server.sh'