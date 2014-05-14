require_relative 'production'

Mail.register_interceptor RecipientInterceptor.new(
  ENV['EMAIL_RECIPIENTS'] || ['marcelo.jacobus@gmail.com'],
  subject_prefix: '[staging]'
)

RubyJobsBrazil::Application.configure do
  # ...

  config.action_mailer.default_url_options = { host: 'staging.RubyJobsBrazil.com' }
end
