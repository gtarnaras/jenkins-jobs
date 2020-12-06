import static jobdsl.JobUtils.addDefaults
import static jobdsl.JobUtils.addTimestampsWrapper

folderName = 'myjobs'

folder(folderName) {
    description('My Jobs')
}

job = freeStyleJob("$folderName/test-job2")
addDefaults(job)
addTimestampsWrapper(job)

job.with {
    steps {
        shell 'echo another one'
    }
}
