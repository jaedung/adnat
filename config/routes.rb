Rails.application.routes.draw do

  root to: "home#index"

  devise_for :users

  # organisations
  get "/organisations/:id/join", to: "organisations#join"
  get "/organisations/:id/edit", to: "organisations#edit"
  get "/organisations/:id/leave", to: "organisations#leave"
  post "/organisations", to: "organisations#create"
  post "/organisations/:id", to: "organisations#update"
  delete "/organisations/:id", to: "organisations#destroy"

  get "/organisations/:id/shifts", to: "organisations#shifts"
  post "/organisations/:id/shifts", to: "organisations#create_shift"

end
