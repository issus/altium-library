#!/bin/sh
# Create MySQL credentials for 'altium' user, both local and remote

cat << EOF > .create_users
CREATE USER 'altium'@'localhost' IDENTIFIED BY 'altium';
GRANT ALL PRIVILEGES ON *.* TO 'altium'@'localhost' WITH GRANT OPTION;
CREATE USER 'altium'@'%' IDENTIFIED BY 'altium';
GRANT ALL PRIVILEGES ON *.* TO 'altium'@'%' WITH GRANT OPTION;
GRANT ALL ON *.* to altium@localhost IDENTIFIED BY 'altium';
GRANT ALL ON *.* to altium@'%' IDENTIFIED BY 'altium';
EOF

#mysql5 -u root  < .create_users
mysql.exe -u root -p < .create_users
rm -f .create_users


