# README

Demo Active Job worker crash when a Job causes an Exception in a Queue Adapter.

1. `bundle install`
2. `bin/rails db:migrate`
3. `bin/rails db:seed`
4. `bin/rails jobs:work`

Crashes the worker process with:

```console
$ bin/rails jobs:work
[Worker(host:eris pid:2947)] Starting job worker
[Worker(host:eris pid:2947)] Job TestJob [ab26ce9d-25a6-4ca0-bdf2-7ce8e8be4588] from DelayedJob(default) with arguments: [] (id=15) (queue=default) RUNNING
[Worker(host:eris pid:2947)] Job TestJob [ab26ce9d-25a6-4ca0-bdf2-7ce8e8be4588] from DelayedJob(default) with arguments: [] (id=15) (queue=default) FAILED (0 prior attempts) with RuntimeError: 🤷
rails aborted!
Encoding::UndefinedConversionError: "\xF0" from ASCII-8BIT to UTF-8


Caused by:
🤷
/Users/robertschulze/tmp/activejobtest/app/jobs/test_job.rb:3:in `perform'
Tasks: TOP => jobs:work
```