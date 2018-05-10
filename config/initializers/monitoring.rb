# frozen_string_literal: true

Raven.configure do |config|
  config.dsn = ENV['RAVEN_DSN']
end
