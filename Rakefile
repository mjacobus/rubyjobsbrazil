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

  puts "Skipping feature tests. They are not working in travis at the moment"
  # Rake::Task['feature_specs'].invoke

  # for instance: https://travis-ci.org/mjacobus/rubyjobsbrazil/builds/377387844
  # 4) User Session user logs in and out with facebook
  #   Failure/Error: click_link t("recruiter.links.login.#{strategy_class.provider_key}")
  #
  #   Capybara::ElementNotFound:
  #     Unable to find visible link "Facebook"
  #   # ./spec/support/features/oauth_login_specs.rb:8:in `login_with_strategy'
  #   # ./spec/support/features/oauth_login_specs.rb:26:in `block in user_logs_in_and_out_with'
  #   # -e:1:in `<main>'
end

task :specs do
  ENV.delete('SKIP_COVERAGE')
  sh 'bundle exec rspec --exclude-pattern "spec/{features}/**/*_spec.rb"'
end

task :feature_specs do
  ENV['SKIP_COVERAGE'] = 'true'
  sh 'bundle exec rspec spec/features'
end
