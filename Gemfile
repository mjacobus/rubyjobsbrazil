# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '>= 2.4'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'dotenv-rails', '~> 2.4.0'
gem 'mysql2', '>= 0.4.4', '< 0.6.0'
gem 'puma', '~> 4.3'
gem 'rails', '~> 5.2.0'
gem 'sass-rails', '~> 5.0'
gem 'sentry-raven', '~> 2.7.3'
gem 'uglifier', '>= 1.3.0'

# recruiter dependencies
gem 'devise', '>= 4.7.1'
gem 'draper', '~> 3.0.1'
gem 'foundation-icons-sass-rails', '~> 3.0.0'
gem 'foundation-rails', '~> 5.4.5'
gem 'jquery-rails', '~> 4.3.3'
gem 'kaminari', '~> 1.1.1'
gem 'makeup', '~>0.3.0'
gem 'omniauth', '~> 1.8.1'
gem 'omniauth-facebook', '~> 5.0.0'
gem 'omniauth-github', '~> 1.3.0'
gem 'omniauth-google_oauth2', '~> 0.1.5'
gem 'redcarpet', '~> 3.4.0'
gem 'simple_form', '~> 5.0.0'

group :development, :test do
  gem 'byebug', '~> 10.0.2', platforms: %i[mri mingw x64_mingw]
  gem 'rspec-rails', '~> 3.7.2'
end

group :development do
  gem 'capistrano-bundler', '~> 1.3.0'
  gem 'capistrano-chruby', '~> 0.1.2'
  gem 'capistrano-rails', '~> 1.3.1'
  gem 'listen', '~> 3.1.5'
  gem 'rubocop', '~> 0.55.0'
  gem 'spring', '~> 2.0.2'
  gem 'spring-watcher-listen', '~> 2.0.1'
  gem 'web-console', '~> 3.6.2'
end

group :test do
  gem 'capybara', '~> 3.1.0'
  gem 'chromedriver-helper', '~> 1.2.0'
  gem 'coveralls', '~> 0.8.21', require: false
  gem 'faker', '~> 1.8.7'
  gem 'machinist', github: 'mjacobus/machinist', branch: 'fix-warning'
  gem 'rails-controller-testing', '~> 1.0.2'
  gem 'selenium-webdriver', '~> 3.12.0'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'simplecov', '~> 0.14.1', require: false
  gem 'spring-commands-rspec', '~> 1.0.4'
end
