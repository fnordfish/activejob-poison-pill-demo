class ApplicationJob < ActiveJob::Base
  # Thid has no effect on Exceptions thrown in Queue Adapters
  discard_on Encoding::CompatibilityError
  
  # this will eventually bubble up into the Adapter (when retries exhausted?)
  retry_on Exception, wait: 1.second
  end
