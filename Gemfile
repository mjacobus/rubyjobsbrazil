source 'https://rubygems.org'

# ruby '2.0.0'
gem 'recruiter', '~>1.1.8'
gem 'rails', '~> 4.2'
gem 'therubyracer',  platforms: :ruby
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jbuilder', '~> 2.0'
gem 'kaminari'
gem 'mysql2'
gem 'rack-timeout'
gem 'figaro'
gem 'capistrano', '3.2.1'
gem 'capistrano-rails'
gem 'capistrano-bundler'
gem 'net-ssh', '~> 2.9.2' # avoid build error

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# gem 'unicorn' # causing timeouts

group :test do
  gem "capybara"
  # gem 'capybara-webkit', '>= 1.0.0'
  gem 'database_cleaner'
  # gem 'launchy'
  gem 'shoulda-matchers', require: false
  gem 'simplecov', require: false
  gem 'coveralls', require: false
  # gem 'timecop'
  gem 'webmock'
  gem "spring-commands-rspec"
  gem 'faker'
end

group :development, :test do
  gem 'awesome_print'
  # gem 'pry-rails'
  gem 'rspec-rails', '3.0.0.beta2'
  gem 'machinist', '>= 2.0.0.beta2'

  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  # gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end
