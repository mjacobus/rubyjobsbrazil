server 'some-website',
       roles: %w[web],
       ssh_options: {
         auth_methods: %w[publickey],
         user: 'rails'
       }
