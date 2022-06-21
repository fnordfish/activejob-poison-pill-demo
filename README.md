# README

Demo Active Job worker crash when a Job causes an Exception in a Queue Adapter.

1. `bundle install`
2. `bin/rails db:migrate`
3. `bin/rails db:seed`
4. `bin/rails jobs:work`

Crashes the worker process with:

```console
$ bin/rails --trace jobs:work
** Invoke jobs:work (first_time)
** Invoke jobs:environment_options (first_time)
** Invoke environment (first_time)
** Execute environment
** Execute jobs:environment_options
** Execute jobs:work
[Worker(host:host pid:20391)] Starting job worker
[Worker(host:host pid:20391)] Job TestJob [728919de-bfcc-49bf-94e9-72d6a26faca6] from DelayedJob(default) with arguments: ["🤷"] (id=30) (queue=default) RUNNING
[Worker(host:host pid:20391)] Job TestJob [728919de-bfcc-49bf-94e9-72d6a26faca6] from DelayedJob(default) with arguments: ["🤷"] (id=30) (queue=default) COMPLETED after 0.0140
[Worker(host:host pid:20391)] 1 jobs processed at 32.6137 j/s, 0 failed
[Worker(host:host pid:20391)] Job TestJob [728919de-bfcc-49bf-94e9-72d6a26faca6] from DelayedJob(default) with arguments: ["🤷"] (id=31) (queue=default) RUNNING
[Worker(host:host pid:20391)] Job TestJob [728919de-bfcc-49bf-94e9-72d6a26faca6] from DelayedJob(default) with arguments: ["🤷"] (id=31) (queue=default) COMPLETED after 0.0099
[Worker(host:host pid:20391)] 1 jobs processed at 58.2785 j/s, 0 failed
[Worker(host:host pid:20391)] Job TestJob [728919de-bfcc-49bf-94e9-72d6a26faca6] from DelayedJob(default) with arguments: ["🤷"] (id=32) (queue=default) RUNNING
[Worker(host:host pid:20391)] Job TestJob [728919de-bfcc-49bf-94e9-72d6a26faca6] from DelayedJob(default) with arguments: ["🤷"] (id=32) (queue=default) COMPLETED after 0.0103
[Worker(host:host pid:20391)] 1 jobs processed at 58.9484 j/s, 0 failed
[Worker(host:host pid:20391)] Job TestJob [728919de-bfcc-49bf-94e9-72d6a26faca6] from DelayedJob(default) with arguments: ["🤷"] (id=33) (queue=default) RUNNING
[Worker(host:host pid:20391)] Job TestJob [728919de-bfcc-49bf-94e9-72d6a26faca6] from DelayedJob(default) with arguments: ["🤷"] (id=33) (queue=default) COMPLETED after 0.0104
[Worker(host:host pid:20391)] 1 jobs processed at 56.9282 j/s, 0 failed
[Worker(host:host pid:20391)] Job TestJob [728919de-bfcc-49bf-94e9-72d6a26faca6] from DelayedJob(default) with arguments: ["🤷"] (id=34) (queue=default) RUNNING
rails aborted!
Encoding::CompatibilityError: incompatible character encodings: UTF-8 and ASCII-8BIT
$HOME/.gem/ruby/3.1.0/gems/delayed_job-4.1.10/lib/delayed/worker.rb:273:in `job_say'
$HOME/.gem/ruby/3.1.0/gems/delayed_job-4.1.10/lib/delayed/worker.rb:304:in `handle_failed_job'
$HOME/.gem/ruby/3.1.0/gems/delayed_job-4.1.10/lib/delayed/worker.rb:241:in `block in run'
$HOME/.gem/ruby/3.1.0/gems/delayed_job-4.1.10/lib/delayed/lifecycle.rb:61:in `block in initialize'
$HOME/.gem/ruby/3.1.0/gems/delayed_job-4.1.10/lib/delayed/lifecycle.rb:66:in `execute'
$HOME/.gem/ruby/3.1.0/gems/delayed_job-4.1.10/lib/delayed/lifecycle.rb:40:in `run_callbacks'
$HOME/.gem/ruby/3.1.0/gems/delayed_job-4.1.10/lib/delayed/worker.rb:241:in `rescue in run'
$HOME/.gem/ruby/3.1.0/gems/delayed_job-4.1.10/lib/delayed/worker.rb:227:in `run'
$HOME/.gem/ruby/3.1.0/gems/delayed_job-4.1.10/lib/delayed/worker.rb:312:in `block in reserve_and_run_one_job'
$HOME/.gem/ruby/3.1.0/gems/delayed_job-4.1.10/lib/delayed/lifecycle.rb:61:in `block in initialize'
$HOME/.gem/ruby/3.1.0/gems/delayed_job-4.1.10/lib/delayed/lifecycle.rb:66:in `execute'
$HOME/.gem/ruby/3.1.0/gems/delayed_job-4.1.10/lib/delayed/lifecycle.rb:40:in `run_callbacks'
$HOME/.gem/ruby/3.1.0/gems/delayed_job-4.1.10/lib/delayed/worker.rb:312:in `reserve_and_run_one_job'
$HOME/.gem/ruby/3.1.0/gems/delayed_job-4.1.10/lib/delayed/worker.rb:213:in `block in work_off'
$HOME/.gem/ruby/3.1.0/gems/delayed_job-4.1.10/lib/delayed/worker.rb:212:in `times'
$HOME/.gem/ruby/3.1.0/gems/delayed_job-4.1.10/lib/delayed/worker.rb:212:in `work_off'
$HOME/.gem/ruby/3.1.0/gems/delayed_job-4.1.10/lib/delayed/worker.rb:175:in `block (4 levels) in start'
$HOME/.rubies/ruby-3.1.0/lib/ruby/3.1.0/benchmark.rb:311:in `realtime'
$HOME/.gem/ruby/3.1.0/gems/delayed_job-4.1.10/lib/delayed/worker.rb:174:in `block (3 levels) in start'
$HOME/.gem/ruby/3.1.0/gems/delayed_job-4.1.10/lib/delayed/lifecycle.rb:61:in `block in initialize'
$HOME/.gem/ruby/3.1.0/gems/delayed_job-4.1.10/lib/delayed/lifecycle.rb:66:in `execute'
$HOME/.gem/ruby/3.1.0/gems/delayed_job-4.1.10/lib/delayed/lifecycle.rb:40:in `run_callbacks'
$HOME/.gem/ruby/3.1.0/gems/delayed_job-4.1.10/lib/delayed/worker.rb:173:in `block (2 levels) in start'
$HOME/.gem/ruby/3.1.0/gems/delayed_job-4.1.10/lib/delayed/worker.rb:172:in `loop'
$HOME/.gem/ruby/3.1.0/gems/delayed_job-4.1.10/lib/delayed/worker.rb:172:in `block in start'
$HOME/.gem/ruby/3.1.0/gems/delayed_job-4.1.10/lib/delayed/plugins/clear_locks.rb:7:in `block (2 levels) in <class:ClearLocks>'
$HOME/.gem/ruby/3.1.0/gems/delayed_job-4.1.10/lib/delayed/lifecycle.rb:79:in `block (2 levels) in add'
$HOME/.gem/ruby/3.1.0/gems/delayed_job-4.1.10/lib/delayed/lifecycle.rb:61:in `block in initialize'
$HOME/.gem/ruby/3.1.0/gems/delayed_job-4.1.10/lib/delayed/lifecycle.rb:79:in `block in add'
$HOME/.gem/ruby/3.1.0/gems/delayed_job-4.1.10/lib/delayed/lifecycle.rb:66:in `execute'
$HOME/.gem/ruby/3.1.0/gems/delayed_job-4.1.10/lib/delayed/lifecycle.rb:40:in `run_callbacks'
$HOME/.gem/ruby/3.1.0/gems/delayed_job-4.1.10/lib/delayed/worker.rb:171:in `start'
$HOME/.gem/ruby/3.1.0/gems/delayed_job-4.1.10/lib/delayed/tasks.rb:9:in `block (2 levels) in <top (required)>'
$HOME/.rubies/ruby-3.1.0/lib/ruby/gems/3.1.0/gems/rake-13.0.6/lib/rake/task.rb:281:in `block in execute'
$HOME/.rubies/ruby-3.1.0/lib/ruby/gems/3.1.0/gems/rake-13.0.6/lib/rake/task.rb:281:in `each'
$HOME/.rubies/ruby-3.1.0/lib/ruby/gems/3.1.0/gems/rake-13.0.6/lib/rake/task.rb:281:in `execute'
$HOME/.rubies/ruby-3.1.0/lib/ruby/gems/3.1.0/gems/rake-13.0.6/lib/rake/task.rb:219:in `block in invoke_with_call_chain'
$HOME/.rubies/ruby-3.1.0/lib/ruby/gems/3.1.0/gems/rake-13.0.6/lib/rake/task.rb:199:in `synchronize'
$HOME/.rubies/ruby-3.1.0/lib/ruby/gems/3.1.0/gems/rake-13.0.6/lib/rake/task.rb:199:in `invoke_with_call_chain'
$HOME/.rubies/ruby-3.1.0/lib/ruby/gems/3.1.0/gems/rake-13.0.6/lib/rake/task.rb:188:in `invoke'
$HOME/.rubies/ruby-3.1.0/lib/ruby/gems/3.1.0/gems/rake-13.0.6/lib/rake/application.rb:160:in `invoke_task'
$HOME/.rubies/ruby-3.1.0/lib/ruby/gems/3.1.0/gems/rake-13.0.6/lib/rake/application.rb:116:in `block (2 levels) in top_level'
$HOME/.rubies/ruby-3.1.0/lib/ruby/gems/3.1.0/gems/rake-13.0.6/lib/rake/application.rb:116:in `each'
$HOME/.rubies/ruby-3.1.0/lib/ruby/gems/3.1.0/gems/rake-13.0.6/lib/rake/application.rb:116:in `block in top_level'
$HOME/.rubies/ruby-3.1.0/lib/ruby/gems/3.1.0/gems/rake-13.0.6/lib/rake/application.rb:125:in `run_with_threads'
$HOME/.rubies/ruby-3.1.0/lib/ruby/gems/3.1.0/gems/rake-13.0.6/lib/rake/application.rb:110:in `top_level'
$HOME/.gem/ruby/3.1.0/bundler/gems/rails-7669a4a9757b/railties/lib/rails/commands/rake/rake_command.rb:24:in `block (2 levels) in perform'
$HOME/.rubies/ruby-3.1.0/lib/ruby/gems/3.1.0/gems/rake-13.0.6/lib/rake/application.rb:186:in `standard_exception_handling'
$HOME/.gem/ruby/3.1.0/bundler/gems/rails-7669a4a9757b/railties/lib/rails/commands/rake/rake_command.rb:24:in `block in perform'
$HOME/.rubies/ruby-3.1.0/lib/ruby/gems/3.1.0/gems/rake-13.0.6/lib/rake/rake_module.rb:59:in `with_application'
$HOME/.gem/ruby/3.1.0/bundler/gems/rails-7669a4a9757b/railties/lib/rails/commands/rake/rake_command.rb:18:in `perform'
$HOME/.gem/ruby/3.1.0/bundler/gems/rails-7669a4a9757b/railties/lib/rails/command.rb:51:in `invoke'
$HOME/.gem/ruby/3.1.0/bundler/gems/rails-7669a4a9757b/railties/lib/rails/commands.rb:18:in `<top (required)>'
bin/rails:4:in `require'
bin/rails:4:in `<main>'

Caused by:
🤷
$HOME/tmp/activejobtest/app/jobs/test_job.rb:3:in `perform'
$HOME/.gem/ruby/3.1.0/bundler/gems/rails-7669a4a9757b/activejob/lib/active_job/execution.rb:59:in `block in _perform_job'
$HOME/.gem/ruby/3.1.0/bundler/gems/rails-7669a4a9757b/activesupport/lib/active_support/callbacks.rb:118:in `block in run_callbacks'
$HOME/.gem/ruby/3.1.0/gems/i18n-1.10.0/lib/i18n.rb:328:in `with_locale'
$HOME/.gem/ruby/3.1.0/bundler/gems/rails-7669a4a9757b/activejob/lib/active_job/translation.rb:9:in `block (2 levels) in <module:Translation>'
$HOME/.gem/ruby/3.1.0/bundler/gems/rails-7669a4a9757b/activesupport/lib/active_support/callbacks.rb:127:in `instance_exec'
$HOME/.gem/ruby/3.1.0/bundler/gems/rails-7669a4a9757b/activesupport/lib/active_support/callbacks.rb:127:in `block in run_callbacks'
$HOME/.gem/ruby/3.1.0/bundler/gems/rails-7669a4a9757b/activesupport/lib/active_support/core_ext/time/zones.rb:66:in `use_zone'
$HOME/.gem/ruby/3.1.0/bundler/gems/rails-7669a4a9757b/activejob/lib/active_job/timezones.rb:9:in `block (2 levels) in <module:Timezones>'
$HOME/.gem/ruby/3.1.0/bundler/gems/rails-7669a4a9757b/activesupport/lib/active_support/callbacks.rb:127:in `instance_exec'
$HOME/.gem/ruby/3.1.0/bundler/gems/rails-7669a4a9757b/activesupport/lib/active_support/callbacks.rb:127:in `block in run_callbacks'
$HOME/.gem/ruby/3.1.0/bundler/gems/rails-7669a4a9757b/activesupport/lib/active_support/callbacks.rb:138:in `run_callbacks'
$HOME/.gem/ruby/3.1.0/bundler/gems/rails-7669a4a9757b/activejob/lib/active_job/execution.rb:58:in `_perform_job'
$HOME/.gem/ruby/3.1.0/bundler/gems/rails-7669a4a9757b/activejob/lib/active_job/instrumentation.rb:20:in `_perform_job'
$HOME/.gem/ruby/3.1.0/bundler/gems/rails-7669a4a9757b/activejob/lib/active_job/execution.rb:46:in `perform_now'
$HOME/.gem/ruby/3.1.0/bundler/gems/rails-7669a4a9757b/activejob/lib/active_job/instrumentation.rb:14:in `block in perform_now'
$HOME/.gem/ruby/3.1.0/bundler/gems/rails-7669a4a9757b/activerecord/lib/active_record/railties/job_runtime.rb:13:in `block in instrument'
$HOME/.gem/ruby/3.1.0/bundler/gems/rails-7669a4a9757b/activejob/lib/active_job/instrumentation.rb:28:in `block in instrument'
$HOME/.gem/ruby/3.1.0/bundler/gems/rails-7669a4a9757b/activesupport/lib/active_support/notifications.rb:206:in `block in instrument'
$HOME/.gem/ruby/3.1.0/bundler/gems/rails-7669a4a9757b/activesupport/lib/active_support/notifications/instrumenter.rb:58:in `instrument'
$HOME/.gem/ruby/3.1.0/bundler/gems/rails-7669a4a9757b/activesupport/lib/active_support/notifications.rb:206:in `instrument'
$HOME/.gem/ruby/3.1.0/bundler/gems/rails-7669a4a9757b/activejob/lib/active_job/instrumentation.rb:27:in `instrument'
$HOME/.gem/ruby/3.1.0/bundler/gems/rails-7669a4a9757b/activerecord/lib/active_record/railties/job_runtime.rb:11:in `instrument'
$HOME/.gem/ruby/3.1.0/bundler/gems/rails-7669a4a9757b/activejob/lib/active_job/instrumentation.rb:14:in `perform_now'
$HOME/.gem/ruby/3.1.0/bundler/gems/rails-7669a4a9757b/activejob/lib/active_job/logging.rb:18:in `block in perform_now'
$HOME/.gem/ruby/3.1.0/bundler/gems/rails-7669a4a9757b/activesupport/lib/active_support/tagged_logging.rb:114:in `block in tagged'
$HOME/.gem/ruby/3.1.0/bundler/gems/rails-7669a4a9757b/activesupport/lib/active_support/tagged_logging.rb:38:in `tagged'
$HOME/.gem/ruby/3.1.0/bundler/gems/rails-7669a4a9757b/activesupport/lib/active_support/tagged_logging.rb:114:in `tagged'
$HOME/.gem/ruby/3.1.0/bundler/gems/rails-7669a4a9757b/activejob/lib/active_job/logging.rb:25:in `tag_logger'
$HOME/.gem/ruby/3.1.0/bundler/gems/rails-7669a4a9757b/activejob/lib/active_job/logging.rb:18:in `perform_now'
$HOME/.gem/ruby/3.1.0/bundler/gems/rails-7669a4a9757b/activejob/lib/active_job/execution.rb:24:in `block in execute'
$HOME/.gem/ruby/3.1.0/bundler/gems/rails-7669a4a9757b/activesupport/lib/active_support/callbacks.rb:118:in `block in run_callbacks'
$HOME/.gem/ruby/3.1.0/bundler/gems/rails-7669a4a9757b/activejob/lib/active_job/railtie.rb:54:in `block (4 levels) in <class:Railtie>'
$HOME/.gem/ruby/3.1.0/bundler/gems/rails-7669a4a9757b/activesupport/lib/active_support/execution_wrapper.rb:92:in `wrap'
$HOME/.gem/ruby/3.1.0/bundler/gems/rails-7669a4a9757b/activesupport/lib/active_support/reloader.rb:72:in `block in wrap'
$HOME/.gem/ruby/3.1.0/bundler/gems/rails-7669a4a9757b/activesupport/lib/active_support/execution_wrapper.rb:92:in `wrap'
$HOME/.gem/ruby/3.1.0/bundler/gems/rails-7669a4a9757b/activesupport/lib/active_support/reloader.rb:71:in `wrap'
$HOME/.gem/ruby/3.1.0/bundler/gems/rails-7669a4a9757b/activejob/lib/active_job/railtie.rb:53:in `block (3 levels) in <class:Railtie>'
$HOME/.gem/ruby/3.1.0/bundler/gems/rails-7669a4a9757b/activesupport/lib/active_support/callbacks.rb:127:in `instance_exec'
$HOME/.gem/ruby/3.1.0/bundler/gems/rails-7669a4a9757b/activesupport/lib/active_support/callbacks.rb:127:in `block in run_callbacks'
$HOME/.gem/ruby/3.1.0/bundler/gems/rails-7669a4a9757b/activesupport/lib/active_support/callbacks.rb:138:in `run_callbacks'
$HOME/.gem/ruby/3.1.0/bundler/gems/rails-7669a4a9757b/activejob/lib/active_job/execution.rb:22:in `execute'
$HOME/.gem/ruby/3.1.0/bundler/gems/rails-7669a4a9757b/activejob/lib/active_job/queue_adapters/delayed_job_adapter.rb:47:in `perform'
$HOME/.gem/ruby/3.1.0/gems/delayed_job-4.1.10/lib/delayed/backend/base.rb:81:in `block in invoke_job'
$HOME/.gem/ruby/3.1.0/gems/delayed_job-4.1.10/lib/delayed/lifecycle.rb:61:in `block in initialize'
$HOME/.gem/ruby/3.1.0/gems/delayed_job-4.1.10/lib/delayed/lifecycle.rb:66:in `execute'
$HOME/.gem/ruby/3.1.0/gems/delayed_job-4.1.10/lib/delayed/lifecycle.rb:40:in `run_callbacks'
$HOME/.gem/ruby/3.1.0/gems/delayed_job-4.1.10/lib/delayed/backend/base.rb:78:in `invoke_job'
$HOME/.gem/ruby/3.1.0/gems/delayed_job-4.1.10/lib/delayed/worker.rb:230:in `block (2 levels) in run'
$HOME/.gem/ruby/3.1.0/gems/timeout-0.3.0/lib/timeout.rb:179:in `block in timeout'
$HOME/.gem/ruby/3.1.0/gems/timeout-0.3.0/lib/timeout.rb:186:in `timeout'
$HOME/.gem/ruby/3.1.0/gems/delayed_job-4.1.10/lib/delayed/worker.rb:230:in `block in run'
$HOME/.rubies/ruby-3.1.0/lib/ruby/3.1.0/benchmark.rb:311:in `realtime'
$HOME/.gem/ruby/3.1.0/gems/delayed_job-4.1.10/lib/delayed/worker.rb:229:in `run'
$HOME/.gem/ruby/3.1.0/gems/delayed_job-4.1.10/lib/delayed/worker.rb:312:in `block in reserve_and_run_one_job'
$HOME/.gem/ruby/3.1.0/gems/delayed_job-4.1.10/lib/delayed/lifecycle.rb:61:in `block in initialize'
$HOME/.gem/ruby/3.1.0/gems/delayed_job-4.1.10/lib/delayed/lifecycle.rb:66:in `execute'
$HOME/.gem/ruby/3.1.0/gems/delayed_job-4.1.10/lib/delayed/lifecycle.rb:40:in `run_callbacks'
$HOME/.gem/ruby/3.1.0/gems/delayed_job-4.1.10/lib/delayed/worker.rb:312:in `reserve_and_run_one_job'
$HOME/.gem/ruby/3.1.0/gems/delayed_job-4.1.10/lib/delayed/worker.rb:213:in `block in work_off'
$HOME/.gem/ruby/3.1.0/gems/delayed_job-4.1.10/lib/delayed/worker.rb:212:in `times'
$HOME/.gem/ruby/3.1.0/gems/delayed_job-4.1.10/lib/delayed/worker.rb:212:in `work_off'
$HOME/.gem/ruby/3.1.0/gems/delayed_job-4.1.10/lib/delayed/worker.rb:175:in `block (4 levels) in start'
$HOME/.rubies/ruby-3.1.0/lib/ruby/3.1.0/benchmark.rb:311:in `realtime'
$HOME/.gem/ruby/3.1.0/gems/delayed_job-4.1.10/lib/delayed/worker.rb:174:in `block (3 levels) in start'
$HOME/.gem/ruby/3.1.0/gems/delayed_job-4.1.10/lib/delayed/lifecycle.rb:61:in `block in initialize'
$HOME/.gem/ruby/3.1.0/gems/delayed_job-4.1.10/lib/delayed/lifecycle.rb:66:in `execute'
$HOME/.gem/ruby/3.1.0/gems/delayed_job-4.1.10/lib/delayed/lifecycle.rb:40:in `run_callbacks'
$HOME/.gem/ruby/3.1.0/gems/delayed_job-4.1.10/lib/delayed/worker.rb:173:in `block (2 levels) in start'
$HOME/.gem/ruby/3.1.0/gems/delayed_job-4.1.10/lib/delayed/worker.rb:172:in `loop'
$HOME/.gem/ruby/3.1.0/gems/delayed_job-4.1.10/lib/delayed/worker.rb:172:in `block in start'
$HOME/.gem/ruby/3.1.0/gems/delayed_job-4.1.10/lib/delayed/plugins/clear_locks.rb:7:in `block (2 levels) in <class:ClearLocks>'
$HOME/.gem/ruby/3.1.0/gems/delayed_job-4.1.10/lib/delayed/lifecycle.rb:79:in `block (2 levels) in add'
$HOME/.gem/ruby/3.1.0/gems/delayed_job-4.1.10/lib/delayed/lifecycle.rb:61:in `block in initialize'
$HOME/.gem/ruby/3.1.0/gems/delayed_job-4.1.10/lib/delayed/lifecycle.rb:79:in `block in add'
$HOME/.gem/ruby/3.1.0/gems/delayed_job-4.1.10/lib/delayed/lifecycle.rb:66:in `execute'
$HOME/.gem/ruby/3.1.0/gems/delayed_job-4.1.10/lib/delayed/lifecycle.rb:40:in `run_callbacks'
$HOME/.gem/ruby/3.1.0/gems/delayed_job-4.1.10/lib/delayed/worker.rb:171:in `start'
$HOME/.gem/ruby/3.1.0/gems/delayed_job-4.1.10/lib/delayed/tasks.rb:9:in `block (2 levels) in <top (required)>'
$HOME/.rubies/ruby-3.1.0/lib/ruby/gems/3.1.0/gems/rake-13.0.6/lib/rake/task.rb:281:in `block in execute'
$HOME/.rubies/ruby-3.1.0/lib/ruby/gems/3.1.0/gems/rake-13.0.6/lib/rake/task.rb:281:in `each'
$HOME/.rubies/ruby-3.1.0/lib/ruby/gems/3.1.0/gems/rake-13.0.6/lib/rake/task.rb:281:in `execute'
$HOME/.rubies/ruby-3.1.0/lib/ruby/gems/3.1.0/gems/rake-13.0.6/lib/rake/task.rb:219:in `block in invoke_with_call_chain'
$HOME/.rubies/ruby-3.1.0/lib/ruby/gems/3.1.0/gems/rake-13.0.6/lib/rake/task.rb:199:in `synchronize'
$HOME/.rubies/ruby-3.1.0/lib/ruby/gems/3.1.0/gems/rake-13.0.6/lib/rake/task.rb:199:in `invoke_with_call_chain'
$HOME/.rubies/ruby-3.1.0/lib/ruby/gems/3.1.0/gems/rake-13.0.6/lib/rake/task.rb:188:in `invoke'
$HOME/.rubies/ruby-3.1.0/lib/ruby/gems/3.1.0/gems/rake-13.0.6/lib/rake/application.rb:160:in `invoke_task'
$HOME/.rubies/ruby-3.1.0/lib/ruby/gems/3.1.0/gems/rake-13.0.6/lib/rake/application.rb:116:in `block (2 levels) in top_level'
$HOME/.rubies/ruby-3.1.0/lib/ruby/gems/3.1.0/gems/rake-13.0.6/lib/rake/application.rb:116:in `each'
$HOME/.rubies/ruby-3.1.0/lib/ruby/gems/3.1.0/gems/rake-13.0.6/lib/rake/application.rb:116:in `block in top_level'
$HOME/.rubies/ruby-3.1.0/lib/ruby/gems/3.1.0/gems/rake-13.0.6/lib/rake/application.rb:125:in `run_with_threads'
$HOME/.rubies/ruby-3.1.0/lib/ruby/gems/3.1.0/gems/rake-13.0.6/lib/rake/application.rb:110:in `top_level'
$HOME/.gem/ruby/3.1.0/bundler/gems/rails-7669a4a9757b/railties/lib/rails/commands/rake/rake_command.rb:24:in `block (2 levels) in perform'
$HOME/.rubies/ruby-3.1.0/lib/ruby/gems/3.1.0/gems/rake-13.0.6/lib/rake/application.rb:186:in `standard_exception_handling'
$HOME/.gem/ruby/3.1.0/bundler/gems/rails-7669a4a9757b/railties/lib/rails/commands/rake/rake_command.rb:24:in `block in perform'
$HOME/.rubies/ruby-3.1.0/lib/ruby/gems/3.1.0/gems/rake-13.0.6/lib/rake/rake_module.rb:59:in `with_application'
$HOME/.gem/ruby/3.1.0/bundler/gems/rails-7669a4a9757b/railties/lib/rails/commands/rake/rake_command.rb:18:in `perform'
$HOME/.gem/ruby/3.1.0/bundler/gems/rails-7669a4a9757b/railties/lib/rails/command.rb:51:in `invoke'
$HOME/.gem/ruby/3.1.0/bundler/gems/rails-7669a4a9757b/railties/lib/rails/commands.rb:18:in `<top (required)>'
bin/rails:4:in `require'
bin/rails:4:in `<main>'
Tasks: TOP => jobs:work
```