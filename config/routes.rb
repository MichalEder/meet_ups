Rails.application.routes.draw do
  get "/about", to: "about#index"

  root to: "main#index"
  
  get "up" => "rails/health#show", as: :rails_health_check

end
