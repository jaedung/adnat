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

  # shifts
  get "/organisations/:id/shifts", to: "shifts#index"
  get "/organisations/:id/shifts/new", to: "shifts#new"
  get "/organisations/:organisation_id/shifts/:id/edit", to: "shifts#edit"
  post "/organisations/:id/shifts", to: "shifts#create"
  post "/organisations/:organisation_id/shifts/:id", to: "shifts#update"
  delete "/organisations/:organisation_id/shifts/:id", to: "shifts#destroy"

end
