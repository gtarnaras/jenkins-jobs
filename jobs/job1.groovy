import static jobdsl.JobUtils.addDefaults
import static jobdsl.JobUtils.addTimestampsWrapper

folderName = 'myapp'

folder(folderName) {
    description('My App')
}

job = freeStyleJob("$folderName/test-job1")
addDefaults(job)
addTimestampsWrapper(job)

job.with {
    steps {
        shell 'echo test'
    }
}
