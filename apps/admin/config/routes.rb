# Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }
get '/players', to: 'players#index'
get '/players/new', to: 'players#new'
post '/players', to: 'players#create'
