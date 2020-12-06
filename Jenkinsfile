pipeline {
    agent any
    stages {
        stage('build') {
            steps {
                echo 'Hello Covid World'
                sh './setup.sh JenkinsJobs'
            }
        }
        if (BRANCH_NAME == 'master') {
            stage('Test') {
                jobDsl(additionalClasspath: 'src/main/groovy', removedJobAction: 'DELETE', removedViewAction: 'DELETE',
                        targets: 'jobs/jobs.groovy', unstableOnDeprecation: true)
            }
        }
    }
}
