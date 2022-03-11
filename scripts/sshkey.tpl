#cloud-config
packages:
 - httpd
 - stress
runcmd:
 - [sh, -c, echo "<html>Web Server IP `hostname --ipaddress`</html>" > /var/www/html/index.html]
 - [firewall-offline-cmd, --add-port=80/tcp]
 - [systemctl, start, httpd]
 - [systemctl, restart, firewalld]


# #!/bin/bash

# cp /home/opc/.ssh/authorized_keys /home/opc/.ssh/authorized_keys.bak
# echo "${ssh_public_key}" >> /home/opc/.ssh/authorized_keys
# chown -R opc /home/opc/.ssh/authorized_keys
