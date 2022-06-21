class TestJob < ApplicationJob
  def perform(message)
    raise message.dup.force_encoding("ASCII-8BIT")
  end
end
