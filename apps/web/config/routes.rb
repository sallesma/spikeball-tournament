# Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }
root to: 'home#index'
resources :players, only: [:index, :show]
resources :tournaments, only: [:index, :show] do
  resources :registrations, only: [:new, :create]
end
