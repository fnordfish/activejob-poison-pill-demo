class TestJob < ApplicationJob
  def perform(message)
    raise message.force_encoding("ASCII-8BIT")
  end
end
