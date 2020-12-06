import static jobdsl.JobUtils.addDefaults
import static jobdsl.JobUtils.addTimestampsWrapper

folderName = 'myjobs'

folder(folderName) {
    description('My Jobs')
}

job = freeStyleJob("$folderName/test-job")
addDefaults(job)
addTimestampsWrapper(job)

job.with {
    steps {
        shell 'echo test'
    }
}
