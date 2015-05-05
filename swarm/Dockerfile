FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends apt-transport-https ca-certificates
RUN echo "deb https://get.docker.com/ubuntu docker main" > /etc/apt/sources.list.d/docker.list && \
    apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9 && \
    apt-get update -qq

RUN apt-get install -y --no-install-recommends  \
    curl \
    lxc \
    iptables \
    openjdk-7-jre \
    wget \
    unzip \
    lxc-docker \
    git
    
ADD wrapdocker /usr/local/bin/wrapdocker
RUN chmod +x /usr/local/bin/wrapdocker
VOLUME /var/lib/docker

RUN groupadd -g 1000 jenkins && \
    useradd -d /home/jenkins -s /bin/bash -m jenkins -u 1000 -g jenkins && \ 
    usermod -a -G docker jenkins

RUN wget -O /home/jenkins/swarm-client-1.22-jar-with-dependencies.jar http://maven.jenkins-ci.org/content/repositories/releases/org/jenkins-ci/plugins/swarm-client/1.22/swarm-client-1.22-jar-with-dependencies.jar

ADD jenkins-slave-run.sh /
CMD ["/jenkins-slave-run.sh"]
