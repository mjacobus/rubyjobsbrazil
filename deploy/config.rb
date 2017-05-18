# config valid only for current version of Capistrano
lock '3.8.1'

set :application, 'rubyjobsbrazil.com.br'
set :repo_url, 'git@github.com:mjacobus/rubyjobsbrazil.git'
ask :branch, :master
set :deploy_to, "/var/www/apps/#{fetch(:application)}"
set :chruby_ruby, 'ruby-2.4.0'
set :pty, true
set :keep_releases, 10
set :bundle_flags, '--deployment'

append :linked_files,
       'config/database.yml',
       'config/secrets.yml',
       '.env'

append :linked_dirs,
       'log',
       'tmp/pids',
       'tmp/cache',
       'tmp/sockets',
       'public/system'

namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, :restart
end
