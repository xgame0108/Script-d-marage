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
	usermod -aG sudo elian
	echo "User created!"
	echo "Setting SSH..."
	mkdir ~/.ssh
	touch ~/.ssh/authorized_keys
	cat "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDj+m+RMbJHNAMkwxNWe6ZjVM2+SIgGThvRdSXakGyBy8QMvz2tkDXvXhw7h7CvRsSDPJWSunVMib8SLklfke38Q6qIOyQ0Tth1IoQrY5X0M7hxJLx638+KvGdRwNVFKL7o6sKz1XCqfT499+t+H1Vrei89NHHZ+FFJ0EdV4yOIzBTZaXYZgbBsDtg/Nirt2/IH1CKGvu3Txy9DgFc9hZg2yi2fyhsaWMQwDZWhk4tmJ+cxAAyTyauE0uvzaE7sexJgwzy1b6pT2GgYvPEiOlQWQiSa/41gSkIqpd/FgBHJHICowvDTDJBxewswwkLBi5L1LhUD83a4fI8ZzQ7sqj6/ elian@DESKTOP-N9VCS3V" >> ~/.ssh/authorized_keys
	echo 'PermitRootLogin no' >> /etc/ssh/sshd_config
	echo 'PasswordAthentication no' >> /etc/ssh/sshd_config
	echo 'AllowUsers elian no' >> /etc/ssh/sshd_config
	echo "SSH Setup Done"
fi