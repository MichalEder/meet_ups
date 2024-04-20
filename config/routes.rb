Rails.application.routes.draw do
  get "meetups", to: "meetups#my_meetups"

  get "meetup", to: "meetup#new"
  get "meetup/:id", to: "meetup#show", as: "view_meetup"
  get "meetup/:id/edit", to: "meetup#edit", as: "edit_meetup"
  post "meetup", to: "meetup#create"
  patch "meetup/:id", to: "meetup#update", as: "update_meetup"
  delete "/meetup/:id", to: "meetup#destroy", as: "cancel_meetup"

  post '/meetups/:meetup_id/register', to: 'meetup_registrations#create', as: "meetup_registration"
  delete '/meetups/:meetup_id/deregister', to: 'meetup_registrations#destroy', as: "deregister_meetup"


  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"


  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  root to: "main#index"

  get "up" => "rails/health#show", as: :rails_health_check

end
