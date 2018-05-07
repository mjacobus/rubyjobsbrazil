server fetch(:application),
       # user: "deploy",
       roles: %w[web app],
       ssh_options: {
         user: 'deploy', # overrides user setting above
         forward_agent: true,
         auth_methods: %w[publickey]
       }
