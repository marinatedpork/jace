Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'users'
  match '/websocket', to: ActionCable.server, via: [:get, :post]
  mount_ember_app :frontend, to: "/"
  resources :users, only: [:index]
end
