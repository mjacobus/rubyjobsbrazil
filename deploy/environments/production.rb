# frozen_string_literal: true

set :deploy_to, "/var/www/apps/#{fetch(:application)}"

server fetch(:application),
  roles: %w[web app],
  ssh_options: {
    user: 'deploy', # overrides user setting above
    forward_agent: true,
    auth_methods: %w[publickey]
  }
