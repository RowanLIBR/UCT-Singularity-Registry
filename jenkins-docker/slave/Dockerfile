FROM ubuntu:16.04

# Install Docker CLI
RUN apt-get update && apt-get install -y apt-transport-https ca-certificates
RUN apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
RUN echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable" > /etc/apt/sources.list.d/docker.list
RUN apt-get update && apt-get install -y docker-ce --allow-unauthenticated

RUN apt-get update && apt-get install -y openjdk-8-jre curl python python-pip git
RUN easy_install jenkins-webapi


# Get docker-compose in the agent container

RUN curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose && chmod +x /usr/local/bin/docker-compose
RUN mkdir -p /home/jenkins
RUN mkdir -p /var/lib/jenkins

RUN apt-get install python3-setuptools -y
RUN apt-get update 
RUN apt-get install wget -y
RUN apt-get install build-essential -y
RUN apt-get install libssl-dev -y
RUN apt-get install uuid-dev -y
RUN apt-get install libgpgme11-dev -y 
RUN apt-get install squashfs-tools -y
RUN apt-get install libseccomp-dev -y
RUN apt-get install pkg-config -y
RUN apt install python3-pip -y

#pip
#RUN pip3 install sqlalchemy
#RUN pip3 install toolbelt
#RUN pip3 install requests-toolbelt

#Install Singularity
RUN wget -O- http://neuro.debian.net/lists/xenial.us-ca.full | tee /etc/apt/sources.list.d/neurodebian.sources.list
RUN apt-key adv --recv-keys --keyserver hkp://pool.sks-keyservers.net:80 0xA5D32F012649A5A9
RUN apt-get update
RUN apt-get install -y singularity-container
RUN apt-get install debootstrap

#Singularity Registry Client
RUN git clone https://github.com/singularityhub/sregistry-cli
RUN python3 sregistry-cli/setup.py install


ADD slave.py /var/lib/jenkins/slave.py

WORKDIR /home/jenkins

ENV JENKINS_URL "http://jenkins"
ENV JENKINS_SLAVE_ADDRESS ""
ENV JENKINS_USER "admin"
ENV JENKINS_PASS "admin"
ENV SLAVE_NAME ""
ENV SLAVE_SECRET ""
ENV SLAVE_EXECUTORS "1"
ENV SLAVE_LABELS "docker"
ENV SLAVE_WORING_DIR ""
ENV CLEAN_WORKING_DIR "true"

CMD [ "python", "-u", "/var/lib/jenkins/slave.py" ]
