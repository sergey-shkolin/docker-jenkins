#!/bin/bash

set -x

HOST_IP=$(ip route | grep ^default | awk '{print $3}')
JENKINS_SERVER=${JENKINS_SERVER:-$HOST_IP}
JENKINS_PORT=${JENKINS_PORT:-8080}
JENKINS_LABELS=${JENKINS_LABELS:-swarm}
JENKINS_HOME=${JENKINS_HOME:-$HOME}

# start the docker daemon
/usr/local/bin/wrapdocker &

# start swarm slave
java -jar /home/jenkins/swarm-client-1.22-jar-with-dependencies.jar -fsroot "$JENKINS_HOME" -labels "$JENKINS_LABELS" -master http://$JENKINS_SERVER:$JENKINS_PORT $@
