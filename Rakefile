# frozen_string_literal: true

# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

task :travis_ci do
  ENV['RAILS_ENV'] = 'test'

  Rake::Task['db:drop'].invoke
  Rake::Task['db:create'].invoke
  Rake::Task['db:migrate'].invoke
  Rake::Task['specs'].invoke
  Rake::Task['feature_specs'].invoke
end

task :specs do
  ENV.delete('SKIP_COVERAGE')
  sh 'bundle exec rspec --exclude-pattern "spec/{features}/**/*_spec.rb"'
end

task :feature_specs do
  ENV['SKIP_COVERAGE'] = 'true'
  sh 'bundle exec rspec spec/features'
end
