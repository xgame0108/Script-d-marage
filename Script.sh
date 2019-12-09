#! /bin/bash

$ip = ifconfig -a
echo "IP:"
echo $ip

USER_NAME=elian
cat /etc/passwd | grep ${USER_NAME} >/dev/null 2>&1
if [ $? -eq 0 ] ; then
    echo "User Exists"
else
    echo "User Not Found"
	echo "Creating user..."
	useradd -m elian
	echo -e "tge247\ntge247" | passwd elian
	echo "User created!"
fi