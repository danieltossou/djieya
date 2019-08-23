Rails.application.routes.draw do
  resources :inscriptions
  resources :etudiants
  devise_for :admins, path: 'admins'
  resources :dossiers
  resources :classe_rooms
  resources :ecoles
  resources :annees
  devise_for :users, path: 'users', controllers: { registrations: 'users/registrations' }
  root to: 'pages#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
