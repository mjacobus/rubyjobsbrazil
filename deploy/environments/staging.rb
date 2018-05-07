set :deploy_to, "/var/www/apps/staging.#{fetch(:application)}"
set :deploy_to, "/var/www/apps/staging.#{fetch(:application)}"

server "staging.#{fetch(:application)}",
  roles: %w[web app],
  ssh_options: {
    user: 'deploy', # overrides user setting above
    forward_agent: true,
    auth_methods: %w[publickey]
  }
