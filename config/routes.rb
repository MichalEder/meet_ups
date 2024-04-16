Rails.application.routes.draw do
  get "/about", to: "about#index"

  get "test", to: "registrations#test"

  get "sign_up_user", to: "registrations#new_user"
  post "sign_up_user", to: "registrations#create_user"

  get "sign_up_organizer", to: "registrations#new_organizer"
  post "sign_up_organizer", to: "registrations#create_organizer"

  root to: "main#index"

  
  get "up" => "rails/health#show", as: :rails_health_check

end
