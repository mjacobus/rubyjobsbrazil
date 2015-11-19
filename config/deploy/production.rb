set :stage, :production
set :application, 'rubyjobsbrazil.com.br'
set :deploy_to, "/home/rubyjobsbrazil/sites/#{fetch(:application)}"

set :user, 'rubyjobsbrazil'
set :password, ask('Password', nil)

server 'rubyjobsbrazil.com.br',
  user: fetch(:user),
  roles: %w{web app db},
  ssh_options: {
    auth_methods: %w(publickey)
  }
