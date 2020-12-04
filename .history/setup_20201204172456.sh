#!/usr/bin/env bash

DISCOVER_DIR=$1

function cleanup {
    rm jenkins-cli.jar
}
function set_me_up {
    wget http://localhost:8080/jnlpJars/jenkins-cli.jar
    for jenkins_job in ${DISCOVER_DIR}/*.xml; do
        java -jar jenkins-cli.jar -s http://localhost:8080/ -auth swarm:swarm create-job $(basename ${jenkins_job} | cut -d"." -f1) < ${jenkins_job}\
        || (java -jar jenkins-cli.jar -s http://localhost:8080/ -auth swarm:swarm update-job $(basename ${jenkins_job} | cut -d"." -f1) < ${jenkins_job})
    done
}

trap cleanup EXIT
set_me_up
