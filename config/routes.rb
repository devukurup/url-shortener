Rails.application.routes.draw do
  resources :links, only: %i[show new create]
  
  root "home#index"
  get "*path", to: "home#index", via: :all
end
