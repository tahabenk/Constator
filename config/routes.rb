Rails.application.routes.draw do
  resources :insurance_policies
  resources :insurance_certificates
  resources :vehicles
  resources :declarations
  resources :reports
  resources :drivers
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
