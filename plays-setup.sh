#bin /bash

echo "* Create an inventory file..."
mkdir plays
cd plays
cp /vagrant/ansible.cfg .

echo "* Create an inventory file..."
cp /vagrant/inventory .

echo "* Copy the web and db files..."
mkdir -p files
cp -r /vagrant/db/ files/
cp -r /vagrant/web/ files/

echo "* Create playbook, install docker and launch nginx container..."
mkdir -p roles/docker/tasks
echo "- import_tasks: docker-debian.yml" >> roles/docker/tasks/main.yml
cp /vagrant/docker-debian.yml roles/docker/tasks/
cp /vagrant/docker.yml .
ansible-playbook -i inventory docker.yml

echo "* Create playbook, install apache, php, and launch the webapp..."
mkdir -p roles/web/tasks
echo "- import_tasks: web-debian.yml" >> roles/web/tasks/main.yml
cp /vagrant/web-debian.yml roles/web/tasks/
cp /vagrant/webserver.yml .
ansible-playbook -i inventory webserver.yml

echo "* Create playbook, install mariadb and launch the db..."
mkdir -p roles/db/tasks
echo "- import_tasks: db-centos.yml" >> roles/db/tasks/main.yml
cp /vagrant/db-centos.yml roles/db/tasks/
cp /vagrant/dbserver.yml .
ansible-playbook -i inventory dbserver.yml
