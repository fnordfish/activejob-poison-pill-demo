class ApplicationJob < ActiveJob::Base
  # Those have no effect on Exceptions thrown in Queue Adapters
  discard_on Encoding::UndefinedConversionError
  retry_on Exception
  
  # Automatically retry jobs that encountered a deadlock
  # retry_on ActiveRecord::Deadlocked

  # Most jobs are safe to ignore if the underlying records are no longer available
  # discard_on ActiveJob::DeserializationError
end
