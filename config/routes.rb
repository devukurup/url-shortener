Rails.application.routes.draw do
  resources :links, only: %i[show new create]
  get ':slug', to: 'redirects#show', slug: /[0-9a-fA-F]+/
  
  root 'home#index'
  get '*path', to: 'home#index', via: :all
end
