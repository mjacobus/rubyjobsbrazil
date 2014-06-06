set :stage, :production
set :application, 'rubyjobsbrazil.com.br'
set :deploy_to, "/webapps/#{fetch(:application)}"

set :user, ask('Username', 'root')
set :password, ask('Password', nil)

server 'www.achouveiculos.com.br',
  user: fetch(:user),
  password: fetch(:password),
  roles: %w{web app db}
