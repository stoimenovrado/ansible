#bin $bash

echo "* Install ansible ..."
apt update
apt install software-properties-common -y
add-apt-repository --yes --update ppa:ansible/ansible
apt install ansible -y
apt install sshpass -y
apt install vim -y