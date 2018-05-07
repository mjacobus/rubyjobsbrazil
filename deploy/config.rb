# config valid only for current version of Capistrano
lock '3.10.2'

set :application, 'rubyjobsbrazil.com.br'
set :repo_url, 'git@github.com:mjacobus/rubyjobsbrazil.git'

if ENV['BRANCH']
  set :branch, ENV['BRANCH']
else
  ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
end

set :chruby_ruby, 'ruby-2.5.1'
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
