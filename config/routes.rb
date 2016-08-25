Rails.application.routes.draw do
  match '/websocket', to: ActionCable.server, via: [:get, :post]
  
  mount_ember_app :frontend, to: "/"

  resources :users, only: [:index]
end
