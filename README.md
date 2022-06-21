# README

Demo Active Job worker crash when a Job causes an Exception in a Queue Adapter.

1. `docker compose build`
2. `docker compose run app bin/rails db:migrate db:seed`
4. `docker compose run app bin/rails jobs:work`

Crashes the worker process with:

```console
$ ❯ docker compose run --rm app bin/rails --trace jobs:work
[+] Running 1/0
 ⠿ Container activejobtest-postgres-1  Running                                                                                                                                                      0.0s
** Invoke jobs:work (first_time)
** Invoke jobs:environment_options (first_time)
** Invoke environment (first_time)
** Execute environment
** Execute jobs:environment_options
** Execute jobs:work
[Worker(host:0105539fcc57 pid:1)] Starting job worker
[Worker(host:0105539fcc57 pid:1)] Job TestJob [a89fcca2-6606-4e7f-a7fd-540adc76c94c] from DelayedJob(default) with arguments: ["🤷"] (id=83) (queue=default) RUNNING
[Worker(host:0105539fcc57 pid:1)] Job TestJob [a89fcca2-6606-4e7f-a7fd-540adc76c94c] from DelayedJob(default) with arguments: ["🤷"] (id=83) (queue=default) COMPLETED after 0.0424
[Worker(host:0105539fcc57 pid:1)] 1 jobs processed at 9.3762 j/s, 0 failed
[Worker(host:0105539fcc57 pid:1)] Job TestJob [a89fcca2-6606-4e7f-a7fd-540adc76c94c] from DelayedJob(default) with arguments: ["🤷"] (id=84) (queue=default) RUNNING
[Worker(host:0105539fcc57 pid:1)] Job TestJob [a89fcca2-6606-4e7f-a7fd-540adc76c94c] from DelayedJob(default) with arguments: ["🤷"] (id=84) (queue=default) COMPLETED after 0.0202
[Worker(host:0105539fcc57 pid:1)] 1 jobs processed at 32.9171 j/s, 0 failed
[Worker(host:0105539fcc57 pid:1)] Job TestJob [a89fcca2-6606-4e7f-a7fd-540adc76c94c] from DelayedJob(default) with arguments: ["🤷"] (id=85) (queue=default) RUNNING
[Worker(host:0105539fcc57 pid:1)] Job TestJob [a89fcca2-6606-4e7f-a7fd-540adc76c94c] from DelayedJob(default) with arguments: ["🤷"] (id=85) (queue=default) COMPLETED after 0.0186
[Worker(host:0105539fcc57 pid:1)] 1 jobs processed at 35.1869 j/s, 0 failed
[Worker(host:0105539fcc57 pid:1)] Job TestJob [a89fcca2-6606-4e7f-a7fd-540adc76c94c] from DelayedJob(default) with arguments: ["🤷"] (id=86) (queue=default) RUNNING
[Worker(host:0105539fcc57 pid:1)] Job TestJob [a89fcca2-6606-4e7f-a7fd-540adc76c94c] from DelayedJob(default) with arguments: ["🤷"] (id=86) (queue=default) COMPLETED after 0.0191
[Worker(host:0105539fcc57 pid:1)] 1 jobs processed at 32.5472 j/s, 0 failed
[Worker(host:0105539fcc57 pid:1)] Job TestJob [a89fcca2-6606-4e7f-a7fd-540adc76c94c] from DelayedJob(default) with arguments: ["🤷"] (id=87) (queue=default) RUNNING
rails aborted!
Encoding::CompatibilityError: incompatible character encodings: UTF-8 and ASCII-8BIT
/usr/local/bundle/gems/delayed_job-4.1.10/lib/delayed/worker.rb:273:in `job_say'
/usr/local/bundle/gems/delayed_job-4.1.10/lib/delayed/worker.rb:304:in `handle_failed_job'
/usr/local/bundle/gems/delayed_job-4.1.10/lib/delayed/worker.rb:241:in `block in run'
/usr/local/bundle/gems/delayed_job-4.1.10/lib/delayed/lifecycle.rb:61:in `block in initialize'
/usr/local/bundle/gems/delayed_job-4.1.10/lib/delayed/lifecycle.rb:66:in `execute'
/usr/local/bundle/gems/delayed_job-4.1.10/lib/delayed/lifecycle.rb:40:in `run_callbacks'
/usr/local/bundle/gems/delayed_job-4.1.10/lib/delayed/worker.rb:241:in `rescue in run'
/usr/local/bundle/gems/delayed_job-4.1.10/lib/delayed/worker.rb:227:in `run'
/usr/local/bundle/gems/delayed_job-4.1.10/lib/delayed/worker.rb:312:in `block in reserve_and_run_one_job'
/usr/local/bundle/gems/delayed_job-4.1.10/lib/delayed/lifecycle.rb:61:in `block in initialize'
/usr/local/bundle/gems/delayed_job-4.1.10/lib/delayed/lifecycle.rb:66:in `execute'
/usr/local/bundle/gems/delayed_job-4.1.10/lib/delayed/lifecycle.rb:40:in `run_callbacks'
/usr/local/bundle/gems/delayed_job-4.1.10/lib/delayed/worker.rb:312:in `reserve_and_run_one_job'
/usr/local/bundle/gems/delayed_job-4.1.10/lib/delayed/worker.rb:213:in `block in work_off'
/usr/local/bundle/gems/delayed_job-4.1.10/lib/delayed/worker.rb:212:in `times'
/usr/local/bundle/gems/delayed_job-4.1.10/lib/delayed/worker.rb:212:in `work_off'
/usr/local/bundle/gems/delayed_job-4.1.10/lib/delayed/worker.rb:175:in `block (4 levels) in start'
/usr/local/lib/ruby/3.1.0/benchmark.rb:311:in `realtime'
/usr/local/bundle/gems/delayed_job-4.1.10/lib/delayed/worker.rb:174:in `block (3 levels) in start'
/usr/local/bundle/gems/delayed_job-4.1.10/lib/delayed/lifecycle.rb:61:in `block in initialize'
/usr/local/bundle/gems/delayed_job-4.1.10/lib/delayed/lifecycle.rb:66:in `execute'
/usr/local/bundle/gems/delayed_job-4.1.10/lib/delayed/lifecycle.rb:40:in `run_callbacks'
/usr/local/bundle/gems/delayed_job-4.1.10/lib/delayed/worker.rb:173:in `block (2 levels) in start'
/usr/local/bundle/gems/delayed_job-4.1.10/lib/delayed/worker.rb:172:in `loop'
/usr/local/bundle/gems/delayed_job-4.1.10/lib/delayed/worker.rb:172:in `block in start'
/usr/local/bundle/gems/delayed_job-4.1.10/lib/delayed/plugins/clear_locks.rb:7:in `block (2 levels) in <class:ClearLocks>'
/usr/local/bundle/gems/delayed_job-4.1.10/lib/delayed/lifecycle.rb:79:in `block (2 levels) in add'
/usr/local/bundle/gems/delayed_job-4.1.10/lib/delayed/lifecycle.rb:61:in `block in initialize'
/usr/local/bundle/gems/delayed_job-4.1.10/lib/delayed/lifecycle.rb:79:in `block in add'
/usr/local/bundle/gems/delayed_job-4.1.10/lib/delayed/lifecycle.rb:66:in `execute'
/usr/local/bundle/gems/delayed_job-4.1.10/lib/delayed/lifecycle.rb:40:in `run_callbacks'
/usr/local/bundle/gems/delayed_job-4.1.10/lib/delayed/worker.rb:171:in `start'
/usr/local/bundle/gems/delayed_job-4.1.10/lib/delayed/tasks.rb:9:in `block (2 levels) in <top (required)>'
/usr/local/lib/ruby/gems/3.1.0/gems/rake-13.0.6/lib/rake/task.rb:281:in `block in execute'
/usr/local/lib/ruby/gems/3.1.0/gems/rake-13.0.6/lib/rake/task.rb:281:in `each'
/usr/local/lib/ruby/gems/3.1.0/gems/rake-13.0.6/lib/rake/task.rb:281:in `execute'
/usr/local/lib/ruby/gems/3.1.0/gems/rake-13.0.6/lib/rake/task.rb:219:in `block in invoke_with_call_chain'
/usr/local/lib/ruby/gems/3.1.0/gems/rake-13.0.6/lib/rake/task.rb:199:in `synchronize'
/usr/local/lib/ruby/gems/3.1.0/gems/rake-13.0.6/lib/rake/task.rb:199:in `invoke_with_call_chain'
/usr/local/lib/ruby/gems/3.1.0/gems/rake-13.0.6/lib/rake/task.rb:188:in `invoke'
/usr/local/lib/ruby/gems/3.1.0/gems/rake-13.0.6/lib/rake/application.rb:160:in `invoke_task'
/usr/local/lib/ruby/gems/3.1.0/gems/rake-13.0.6/lib/rake/application.rb:116:in `block (2 levels) in top_level'
/usr/local/lib/ruby/gems/3.1.0/gems/rake-13.0.6/lib/rake/application.rb:116:in `each'
/usr/local/lib/ruby/gems/3.1.0/gems/rake-13.0.6/lib/rake/application.rb:116:in `block in top_level'
/usr/local/lib/ruby/gems/3.1.0/gems/rake-13.0.6/lib/rake/application.rb:125:in `run_with_threads'
/usr/local/lib/ruby/gems/3.1.0/gems/rake-13.0.6/lib/rake/application.rb:110:in `top_level'
/usr/local/bundle/bundler/gems/rails-7669a4a9757b/railties/lib/rails/commands/rake/rake_command.rb:24:in `block (2 levels) in perform'
/usr/local/lib/ruby/gems/3.1.0/gems/rake-13.0.6/lib/rake/application.rb:186:in `standard_exception_handling'
/usr/local/bundle/bundler/gems/rails-7669a4a9757b/railties/lib/rails/commands/rake/rake_command.rb:24:in `block in perform'
/usr/local/lib/ruby/gems/3.1.0/gems/rake-13.0.6/lib/rake/rake_module.rb:59:in `with_application'
/usr/local/bundle/bundler/gems/rails-7669a4a9757b/railties/lib/rails/commands/rake/rake_command.rb:18:in `perform'
/usr/local/bundle/bundler/gems/rails-7669a4a9757b/railties/lib/rails/command.rb:51:in `invoke'
/usr/local/bundle/bundler/gems/rails-7669a4a9757b/railties/lib/rails/commands.rb:18:in `<top (required)>'
bin/rails:4:in `require'
bin/rails:4:in `<main>'

Caused by:
🤷
/usr/src/app/app/jobs/test_job.rb:3:in `perform'
/usr/local/bundle/bundler/gems/rails-7669a4a9757b/activejob/lib/active_job/execution.rb:59:in `block in _perform_job'
/usr/local/bundle/bundler/gems/rails-7669a4a9757b/activesupport/lib/active_support/callbacks.rb:118:in `block in run_callbacks'
/usr/local/bundle/gems/i18n-1.10.0/lib/i18n.rb:328:in `with_locale'
/usr/local/bundle/bundler/gems/rails-7669a4a9757b/activejob/lib/active_job/translation.rb:9:in `block (2 levels) in <module:Translation>'
/usr/local/bundle/bundler/gems/rails-7669a4a9757b/activesupport/lib/active_support/callbacks.rb:127:in `instance_exec'
/usr/local/bundle/bundler/gems/rails-7669a4a9757b/activesupport/lib/active_support/callbacks.rb:127:in `block in run_callbacks'
/usr/local/bundle/bundler/gems/rails-7669a4a9757b/activesupport/lib/active_support/core_ext/time/zones.rb:66:in `use_zone'
/usr/local/bundle/bundler/gems/rails-7669a4a9757b/activejob/lib/active_job/timezones.rb:9:in `block (2 levels) in <module:Timezones>'
/usr/local/bundle/bundler/gems/rails-7669a4a9757b/activesupport/lib/active_support/callbacks.rb:127:in `instance_exec'
/usr/local/bundle/bundler/gems/rails-7669a4a9757b/activesupport/lib/active_support/callbacks.rb:127:in `block in run_callbacks'
/usr/local/bundle/bundler/gems/rails-7669a4a9757b/activesupport/lib/active_support/callbacks.rb:138:in `run_callbacks'
/usr/local/bundle/bundler/gems/rails-7669a4a9757b/activejob/lib/active_job/execution.rb:58:in `_perform_job'
/usr/local/bundle/bundler/gems/rails-7669a4a9757b/activejob/lib/active_job/instrumentation.rb:20:in `_perform_job'
/usr/local/bundle/bundler/gems/rails-7669a4a9757b/activejob/lib/active_job/execution.rb:46:in `perform_now'
/usr/local/bundle/bundler/gems/rails-7669a4a9757b/activejob/lib/active_job/instrumentation.rb:14:in `block in perform_now'
/usr/local/bundle/bundler/gems/rails-7669a4a9757b/activerecord/lib/active_record/railties/job_runtime.rb:13:in `block in instrument'
/usr/local/bundle/bundler/gems/rails-7669a4a9757b/activejob/lib/active_job/instrumentation.rb:28:in `block in instrument'
/usr/local/bundle/bundler/gems/rails-7669a4a9757b/activesupport/lib/active_support/notifications.rb:206:in `block in instrument'
/usr/local/bundle/bundler/gems/rails-7669a4a9757b/activesupport/lib/active_support/notifications/instrumenter.rb:58:in `instrument'
/usr/local/bundle/bundler/gems/rails-7669a4a9757b/activesupport/lib/active_support/notifications.rb:206:in `instrument'
/usr/local/bundle/bundler/gems/rails-7669a4a9757b/activejob/lib/active_job/instrumentation.rb:27:in `instrument'
/usr/local/bundle/bundler/gems/rails-7669a4a9757b/activerecord/lib/active_record/railties/job_runtime.rb:11:in `instrument'
/usr/local/bundle/bundler/gems/rails-7669a4a9757b/activejob/lib/active_job/instrumentation.rb:14:in `perform_now'
/usr/local/bundle/bundler/gems/rails-7669a4a9757b/activejob/lib/active_job/logging.rb:18:in `block in perform_now'
/usr/local/bundle/bundler/gems/rails-7669a4a9757b/activesupport/lib/active_support/tagged_logging.rb:114:in `block in tagged'
/usr/local/bundle/bundler/gems/rails-7669a4a9757b/activesupport/lib/active_support/tagged_logging.rb:38:in `tagged'
/usr/local/bundle/bundler/gems/rails-7669a4a9757b/activesupport/lib/active_support/tagged_logging.rb:114:in `tagged'
/usr/local/bundle/bundler/gems/rails-7669a4a9757b/activejob/lib/active_job/logging.rb:25:in `tag_logger'
/usr/local/bundle/bundler/gems/rails-7669a4a9757b/activejob/lib/active_job/logging.rb:18:in `perform_now'
/usr/local/bundle/bundler/gems/rails-7669a4a9757b/activejob/lib/active_job/execution.rb:24:in `block in execute'
/usr/local/bundle/bundler/gems/rails-7669a4a9757b/activesupport/lib/active_support/callbacks.rb:118:in `block in run_callbacks'
/usr/local/bundle/bundler/gems/rails-7669a4a9757b/activejob/lib/active_job/railtie.rb:54:in `block (4 levels) in <class:Railtie>'
/usr/local/bundle/bundler/gems/rails-7669a4a9757b/activesupport/lib/active_support/execution_wrapper.rb:92:in `wrap'
/usr/local/bundle/bundler/gems/rails-7669a4a9757b/activesupport/lib/active_support/reloader.rb:72:in `block in wrap'
/usr/local/bundle/bundler/gems/rails-7669a4a9757b/activesupport/lib/active_support/execution_wrapper.rb:92:in `wrap'
/usr/local/bundle/bundler/gems/rails-7669a4a9757b/activesupport/lib/active_support/reloader.rb:71:in `wrap'
/usr/local/bundle/bundler/gems/rails-7669a4a9757b/activejob/lib/active_job/railtie.rb:53:in `block (3 levels) in <class:Railtie>'
/usr/local/bundle/bundler/gems/rails-7669a4a9757b/activesupport/lib/active_support/callbacks.rb:127:in `instance_exec'
/usr/local/bundle/bundler/gems/rails-7669a4a9757b/activesupport/lib/active_support/callbacks.rb:127:in `block in run_callbacks'
/usr/local/bundle/bundler/gems/rails-7669a4a9757b/activesupport/lib/active_support/callbacks.rb:138:in `run_callbacks'
/usr/local/bundle/bundler/gems/rails-7669a4a9757b/activejob/lib/active_job/execution.rb:22:in `execute'
/usr/local/bundle/bundler/gems/rails-7669a4a9757b/activejob/lib/active_job/queue_adapters/delayed_job_adapter.rb:47:in `perform'
/usr/local/bundle/gems/delayed_job-4.1.10/lib/delayed/backend/base.rb:81:in `block in invoke_job'
/usr/local/bundle/gems/delayed_job-4.1.10/lib/delayed/lifecycle.rb:61:in `block in initialize'
/usr/local/bundle/gems/delayed_job-4.1.10/lib/delayed/lifecycle.rb:66:in `execute'
/usr/local/bundle/gems/delayed_job-4.1.10/lib/delayed/lifecycle.rb:40:in `run_callbacks'
/usr/local/bundle/gems/delayed_job-4.1.10/lib/delayed/backend/base.rb:78:in `invoke_job'
/usr/local/bundle/gems/delayed_job-4.1.10/lib/delayed/worker.rb:230:in `block (2 levels) in run'
/usr/local/bundle/gems/timeout-0.3.0/lib/timeout.rb:179:in `block in timeout'
/usr/local/bundle/gems/timeout-0.3.0/lib/timeout.rb:186:in `timeout'
/usr/local/bundle/gems/delayed_job-4.1.10/lib/delayed/worker.rb:230:in `block in run'
/usr/local/lib/ruby/3.1.0/benchmark.rb:311:in `realtime'
/usr/local/bundle/gems/delayed_job-4.1.10/lib/delayed/worker.rb:229:in `run'
/usr/local/bundle/gems/delayed_job-4.1.10/lib/delayed/worker.rb:312:in `block in reserve_and_run_one_job'
/usr/local/bundle/gems/delayed_job-4.1.10/lib/delayed/lifecycle.rb:61:in `block in initialize'
/usr/local/bundle/gems/delayed_job-4.1.10/lib/delayed/lifecycle.rb:66:in `execute'
/usr/local/bundle/gems/delayed_job-4.1.10/lib/delayed/lifecycle.rb:40:in `run_callbacks'
/usr/local/bundle/gems/delayed_job-4.1.10/lib/delayed/worker.rb:312:in `reserve_and_run_one_job'
/usr/local/bundle/gems/delayed_job-4.1.10/lib/delayed/worker.rb:213:in `block in work_off'
/usr/local/bundle/gems/delayed_job-4.1.10/lib/delayed/worker.rb:212:in `times'
/usr/local/bundle/gems/delayed_job-4.1.10/lib/delayed/worker.rb:212:in `work_off'
/usr/local/bundle/gems/delayed_job-4.1.10/lib/delayed/worker.rb:175:in `block (4 levels) in start'
/usr/local/lib/ruby/3.1.0/benchmark.rb:311:in `realtime'
/usr/local/bundle/gems/delayed_job-4.1.10/lib/delayed/worker.rb:174:in `block (3 levels) in start'
/usr/local/bundle/gems/delayed_job-4.1.10/lib/delayed/lifecycle.rb:61:in `block in initialize'
/usr/local/bundle/gems/delayed_job-4.1.10/lib/delayed/lifecycle.rb:66:in `execute'
/usr/local/bundle/gems/delayed_job-4.1.10/lib/delayed/lifecycle.rb:40:in `run_callbacks'
/usr/local/bundle/gems/delayed_job-4.1.10/lib/delayed/worker.rb:173:in `block (2 levels) in start'
/usr/local/bundle/gems/delayed_job-4.1.10/lib/delayed/worker.rb:172:in `loop'
/usr/local/bundle/gems/delayed_job-4.1.10/lib/delayed/worker.rb:172:in `block in start'
/usr/local/bundle/gems/delayed_job-4.1.10/lib/delayed/plugins/clear_locks.rb:7:in `block (2 levels) in <class:ClearLocks>'
/usr/local/bundle/gems/delayed_job-4.1.10/lib/delayed/lifecycle.rb:79:in `block (2 levels) in add'
/usr/local/bundle/gems/delayed_job-4.1.10/lib/delayed/lifecycle.rb:61:in `block in initialize'
/usr/local/bundle/gems/delayed_job-4.1.10/lib/delayed/lifecycle.rb:79:in `block in add'
/usr/local/bundle/gems/delayed_job-4.1.10/lib/delayed/lifecycle.rb:66:in `execute'
/usr/local/bundle/gems/delayed_job-4.1.10/lib/delayed/lifecycle.rb:40:in `run_callbacks'
/usr/local/bundle/gems/delayed_job-4.1.10/lib/delayed/worker.rb:171:in `start'
/usr/local/bundle/gems/delayed_job-4.1.10/lib/delayed/tasks.rb:9:in `block (2 levels) in <top (required)>'
/usr/local/lib/ruby/gems/3.1.0/gems/rake-13.0.6/lib/rake/task.rb:281:in `block in execute'
/usr/local/lib/ruby/gems/3.1.0/gems/rake-13.0.6/lib/rake/task.rb:281:in `each'
/usr/local/lib/ruby/gems/3.1.0/gems/rake-13.0.6/lib/rake/task.rb:281:in `execute'
/usr/local/lib/ruby/gems/3.1.0/gems/rake-13.0.6/lib/rake/task.rb:219:in `block in invoke_with_call_chain'
/usr/local/lib/ruby/gems/3.1.0/gems/rake-13.0.6/lib/rake/task.rb:199:in `synchronize'
/usr/local/lib/ruby/gems/3.1.0/gems/rake-13.0.6/lib/rake/task.rb:199:in `invoke_with_call_chain'
/usr/local/lib/ruby/gems/3.1.0/gems/rake-13.0.6/lib/rake/task.rb:188:in `invoke'
/usr/local/lib/ruby/gems/3.1.0/gems/rake-13.0.6/lib/rake/application.rb:160:in `invoke_task'
/usr/local/lib/ruby/gems/3.1.0/gems/rake-13.0.6/lib/rake/application.rb:116:in `block (2 levels) in top_level'
/usr/local/lib/ruby/gems/3.1.0/gems/rake-13.0.6/lib/rake/application.rb:116:in `each'
/usr/local/lib/ruby/gems/3.1.0/gems/rake-13.0.6/lib/rake/application.rb:116:in `block in top_level'
/usr/local/lib/ruby/gems/3.1.0/gems/rake-13.0.6/lib/rake/application.rb:125:in `run_with_threads'
/usr/local/lib/ruby/gems/3.1.0/gems/rake-13.0.6/lib/rake/application.rb:110:in `top_level'
/usr/local/bundle/bundler/gems/rails-7669a4a9757b/railties/lib/rails/commands/rake/rake_command.rb:24:in `block (2 levels) in perform'
/usr/local/lib/ruby/gems/3.1.0/gems/rake-13.0.6/lib/rake/application.rb:186:in `standard_exception_handling'
/usr/local/bundle/bundler/gems/rails-7669a4a9757b/railties/lib/rails/commands/rake/rake_command.rb:24:in `block in perform'
/usr/local/lib/ruby/gems/3.1.0/gems/rake-13.0.6/lib/rake/rake_module.rb:59:in `with_application'
/usr/local/bundle/bundler/gems/rails-7669a4a9757b/railties/lib/rails/commands/rake/rake_command.rb:18:in `perform'
/usr/local/bundle/bundler/gems/rails-7669a4a9757b/railties/lib/rails/command.rb:51:in `invoke'
/usr/local/bundle/bundler/gems/rails-7669a4a9757b/railties/lib/rails/commands.rb:18:in `<top (required)>'
bin/rails:4:in `require'
bin/rails:4:in `<main>'
Tasks: TOP => jobs:work
```