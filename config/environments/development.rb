Rails.application.configure do
  ENV['SECRET_KEY_BASE'] = 'mgKHhDJD-5DNUzx6QZqhBHtlyvAP2oYgutHHySVTX3yddyzVaPo8vSmEpSuNXW1UapnY99Z-nKveDDEWgREiFQ'

  ENV['FACEBOOK_KEY']    = 'fake'
  ENV['FACEBOOK_SECRET'] = 'fake'
  ENV['GOOGLE_KEY']      = 'fake'
  ENV['GOOGLE_SECRET']   = 'fake'
  ENV['GITHUB_KEY']      = 'cf5569da9e7aab3d4b6'
  ENV['GITHUB_SECRET']   = '906be7adc9e30c4252e9e8fa9c6ae222c71998a6'

  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = true

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true
  # Raise an ActionController::UnpermittedParameters exception when
  # a parameter is not explcitly permitted but is passed anyway.
  config.action_controller.action_on_unpermitted_parameters = :raise


  config.action_mailer.default_url_options = { host: 'RubyJobsBrazil.local' }
end
