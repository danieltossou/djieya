Rails.application.routes.draw do
  resources :versements
  resources :inscriptions
  resources :etudiants
  devise_for :admins, path: 'admins'
  resources :dossiers
  resources :classe_rooms
  resources :ecoles
  resources :annees
  devise_for :users, path: 'users', controllers: { registrations: 'users/registrations' }
  root to: 'pages#index'
  get 'users', to: 'pages#users', as: 'users'
  get 'users/:id', to: 'pages#user', as: 'user'
  put 'users/:id', to: 'pages#activer', as: 'activer'
  patch 'users/:id', to: 'pages#desactiver', as: 'desactiver'
  get '/employes', to: 'pages#employes'
  get '/menu_annees', to: 'pages#menu_annees'
  get '/menu_classes', to: 'pages#menu_classes'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
