#!/usr/bin/env bash

DISCOVER_DIR=$1

function set_me_up {
    wget http://localhost:8080/jnlpJars/jenkins-cli.jar
    for jenkins_job in ${DISCOVER_DIR}/*.xml; do
        java -jar jenkins-cli.jar create-job $(basename ${jenkins_job} | cut -d"." -f1) < ${jenkins_job}
        java -jar jenkins-cli.jar update-job $(basename ${jenkins_job} | cut -d"." -f1) < ${jenkins_job}    done
    rm jenkins-cli.jar
}

set_me_up
