#!/usr/bin/env bash

DISCOVER_DIR=$1

function cleanup {
    rm jenkins-cli.jar
}
function set_me_up {
    wget http://localhost:8080/jnlpJars/jenkins-cli.jar
    for jenkins_job in ${DISCOVER_DIR}/*.xml; do
        java -jar jenkins-cli.jar -s localhost:8080 create-job $(basename ${jenkins_job} | cut -d"." -f1) < ${jenkins_job}
        java -jar jenkins-cli.jar -s localhost:8080 update-job $(basename ${jenkins_job} | cut -d"." -f1) < ${jenkins_job}
    done
}

trap finish EXIT
set_me_up
