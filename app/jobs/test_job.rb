class TestJob < ApplicationJob
  def perform(message)
    # this will change the argument itself,
    # which will be written back into the job queue
    raise message.force_encoding("ASCII-8BIT")
  end
end
