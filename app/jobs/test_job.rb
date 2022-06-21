class TestJob < ApplicationJob
  def perform()
    raise "🤷".force_encoding("ASCII-8BIT")
  end
end
