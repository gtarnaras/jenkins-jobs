pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                jobDsl(additionalClasspath: 'src/main/groovy', removedJobAction: 'DELETE', removedViewAction: 'DELETE',
                    targets: 'jobs/jobs.groovy', unstableOnDeprecation: true)
            }
        }
    }
}
