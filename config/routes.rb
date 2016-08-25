Rails.application.routes.draw do
  mount_ember_app :frontend, to: "/"

  resources :users, only: [:index]

  resources :points, only: [:create]

end
