set :stage, :staging
set :branch, :master
set :application, 'rubyjobsbrazil.com.br'
set :deploy_to, "/home/rubyjobsbrazil/sites/staging.#{fetch(:application)}"

set :user, 'rubyjobsbrazil'

server 'rubyjobsbrazil.com.br',
  user: fetch(:user),
  roles: %w{web app db},
  ssh_options: {
    auth_methods: %w(publickey)
  }
