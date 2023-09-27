#!/bin/bash

# echo "" >> /etc/vsftpd.conf
# echo "pasv_address=$DOMAIN_NAME" >> /etc/vsftpd.conf

useradd $FTP_USER && echo "$FTP_USER:$FTP_USER_PASS" | chpasswd
mkdir -p /home/$FTP_USER
chown -R $FTP_USER:$FTP_USER /home/$FTP_USER
chmod 755 /home/$FTP_USER

# echo "USER $FTP_USER CREATED WITH PASSWORD $FTP_USER_PASS";


vsftpd /etc/vsftpd.conf