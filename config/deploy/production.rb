set :stage, :production
set :application, 'rubyjobsbrazil.com.br'
set :deploy_to, "/home/rubyjobsbrazil/sites/#{fetch(:application)}"

set :user, ask('Username', 'rubyjobsbrazil')
set :password, ask('Password', nil)

server 'rubyjobsbrazil.com.br',
  user: fetch(:user),
  password: fetch(:password),
  roles: %w{web app db}
