set :stage, :production


server '128.199.125.71', user: 'deploy', port: 22, roles: %w{web app db}

set :ssh_options, {
  forward_agent: true,
  auth_methods: %w(publickey password)
}

fetch(:default_env).merge!(rails_env: :production)
