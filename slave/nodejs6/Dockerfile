FROM node:6.7

ENV DEBIAN_FRONTEND noninteractive
RUN echo "deb http://http.debian.net/debian jessie-backports main" >> /etc/apt/sources.list

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    apt-transport-https \
    ca-certificates \
    software-properties-common \
    curl \
    wget \
    openjdk-8-jdk \
    git \
    gitstats \
    build-essential \
    rpl

RUN groupadd -g 1000 jenkins && \
    useradd -d /home/jenkins -s /bin/bash -m jenkins -u 1000 -g jenkins

RUN wget -O /home/jenkins/swarm-client.jar http://repo.jenkins-ci.org/releases/org/jenkins-ci/plugins/swarm-client/3.3/swarm-client-3.3.jar

ADD jenkins-slave-run.sh /

CMD ["/jenkins-slave-run.sh"]
	 
