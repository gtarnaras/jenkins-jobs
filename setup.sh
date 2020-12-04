#!/usr/bin/env bash

function set_me_up {
    wget http://localhost:8080/jnlpJars/jenkins-cli.jar
    for jenkins_job in ${ROOT_DIR}/jenkins_jobs/*.xml; do
        java -jar jenkins-cli.jar create-job $(basename ${jenkins_job} | cut -d"." -f1) < ${jenkins_job}
        java -jar jenkins-cli.jar update-job $(basename ${jenkins_job} | cut -d"." -f1) < ${jenkins_job})
    done
    rm jenkins-cli.jar
}

set_me_up
