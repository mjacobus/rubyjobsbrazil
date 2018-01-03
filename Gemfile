source 'https://rubygems.org'

gem 'dotenv-rails', require: 'dotenv/rails-now'

# ruby '2.0.0'
gem 'capistrano', '3.8.1'
gem 'capistrano-bundler'
gem 'capistrano-chruby'
gem 'capistrano-rails'
gem 'coffee-rails', '~> 4.1.0'
gem 'devise', '~> 3.5.2'
gem 'figaro'
gem 'foundation-icons-sass-rails', '~> 3.0.0'
gem 'foundation-rails', '~> 5.5.2'
gem 'jbuilder', '~> 2.0'
gem 'kaminari'
gem 'mysql2'
gem 'net-ssh', '~> 2.9.2' # avoid build error
gem 'rails', '~> 4.2'
gem 'rake', '< 11.0'
gem 'recruiter', '~>1.1.17'
gem 'sass-rails', '~> 5.0'
gem 'sentry-raven'
gem 'therubyracer', platforms: :ruby
gem 'uglifier', '>= 1.3.0'
gem 'yajl-ruby', '~> 1.2.3'

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# gem 'unicorn' # causing timeouts

group :test do
  gem 'capybara'
  # gem 'capybara-webkit', '>= 1.0.0'
  gem 'database_cleaner'
  # gem 'launchy'
  gem 'coveralls', '~> 0.8.1', require: false
  gem 'shoulda-matchers', require: false
  gem 'simplecov', require: false
  # gem 'timecop'
  gem 'faker'
  gem 'spring-commands-rspec'
  gem 'webmock'
end

group :development, :test do
  gem 'awesome_print'
  # gem 'pry-rails'
  gem 'machinist', '>= 2.0.0.beta2'
  gem 'rspec-rails', '3.0.0.beta2'

  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  # gem 'byebug'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
end

group :staging, :production do
  gem 'rack-timeout'
end
