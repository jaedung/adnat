Rails.application.routes.draw do

  root to: "home#index"
  devise_for :users

  # organisations
  get "/organisations/:id/shifts", to: "organisations#shifts"
  get "/organisations/:id/edit", to: "organisations#edit"
  post "/organisations/:id", to: "organisations#update"

end
