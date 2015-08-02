source 'https://rubygems.org'

# ruby '2.0.0'

gem 'rails', '~> 4.2'
gem 'sass-rails'
gem 'uglifier'
gem 'coffee-rails'
gem 'therubyracer',  platforms: :ruby
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development
gem 'recruiter', '~>1.1'

# Rails non default

gem 'email_validator'
gem 'high_voltage'
gem 'mysql2'
gem 'rack-timeout'
gem 'recipient_interceptor'
gem 'simple_form'
gem 'unicorn'
gem 'kaminari'
gem 'vattributes'
gem 'draper', '~> 1.3'
gem 'foundation-rails'
gem 'foundation-icons-sass-rails'
# gem 'github-markup'
gem 'table_cloth'
gem 'capistrano', '3.2.1'
gem 'capistrano-rails'
gem 'capistrano-bundler'
gem 'figaro'

gem 'escape_utils', '~>1.0.1' # fixes compiling error

group :development, :test do
  gem 'awesome_print'
  # gem 'dotenv-rails'
  gem 'pry-rails'
  gem 'rspec-rails', '3.0.0.beta2'
  gem 'machinist', '>= 2.0.0.beta2'
end

group :test do
  gem "capybara"
  # gem 'capybara-webkit', '>= 1.0.0'
  gem 'database_cleaner'
  # gem 'launchy'
  gem 'shoulda-matchers', require: false
  gem 'simplecov', require: false
  gem 'coveralls', require: false
  gem 'timecop'
  gem 'webmock'
  gem "spring-commands-rspec"
  gem 'faker'
end

group :staging, :production do
  # gem 'newrelic_rpm', '>= 3.7.3'
end
