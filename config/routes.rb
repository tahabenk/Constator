Rails.application.routes.draw do
  root to: 'pages#home'
  resources :drivers
  resources :vehicles
  resources :insurance_policies do
    resources :insurance_certificates
  end
  resources :reports do
    resources :declarations
  end

  devise_for :users
  get 'autocomplete/search', to: 'autocomplete#search'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
