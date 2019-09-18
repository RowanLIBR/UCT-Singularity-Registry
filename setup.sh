sudo docker network create -d bridge --subnet 192.168.0.0/24 --gateway 192.168.0.1 dockernet
sudo docker build -t jenkins-master jenkins-docker/master 
sudo docker build -t jenkins-agent jenkins-docker/slave


