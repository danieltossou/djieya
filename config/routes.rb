Rails.application.routes.draw do
  resources :dossiers
  resources :classe_rooms
  resources :ecoles
  resources :annees
  devise_for :users
  root to: 'pages#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
