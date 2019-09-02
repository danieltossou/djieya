Rails.application.routes.draw do
  resources :semestres
  resources :disponibilites
  resources :creneaus
  resources :heures
  resources :jours
  resources :enseignants
  resources :salles
  resources :matieres
  resources :caisses do
    collection do
      get 'depense_new'
      get 'depenses'
      post 'depense_create'
    end
  end
  resources :versements
  resources :inscriptions
  resources :etudiants
  
  # Routes des versement d'un etudiant
    get 'etudiants/:etudiant_id/versements', to: 'versements#etudiant_index', as: 'etudiant_versements'
    get 'etudiants/:etudiant_id/versements/new', to: 'versements#etudiant_new', as: 'new_etudiant_versement'
    post 'etudiants/:etudiant_id/versements', to: 'versements#etudiant_create', as: 'create_etudiant_versement'
    get '/etudiants/:etudiant_id/versements/:id/edit', to: 'versements#etudiant_edit', as: 'edit_etudiant_versement'
    get '/etudiants/:etudiant_id/versements/:id', to: 'versements#etudiant_show', as: 'show_etudiant_versement'
    patch '/etudiants/:etudiant_id/versements/:id', to: 'versements#etudiant_update', as: 'update_etudiant_versement'
    put '/etudiants/:etudiant_id/versements/:id', to: 'versements#etudiant_update'
    delete '/etudiants/:etudiant_id/versements/:id', to: 'versements#etudiant_destroy'

  devise_for :admins, path: 'admins', controllers: { sessions: 'admins/sessions' }
  resources :dossiers
  resources :classe_rooms
  resources :ecoles
  resources :annees
  devise_for :users, path: 'users', controllers: { registrations: 'users/registrations', sessions:'users/sessions' }
  root to: 'pages#index'
  get 'users', to: 'pages#users', as: 'users'
  get 'users/:id', to: 'pages#user', as: 'user'
  put 'users/:id', to: 'pages#activer', as: 'activer'
  patch 'users/:id', to: 'pages#desactiver', as: 'desactiver'
  get '/employes', to: 'pages#employes'
  get '/menu_annees', to: 'pages#menu_annees'
  get '/menu_classes', to: 'pages#menu_classes'
  get '/matiere_enseigne', to: 'pages#matiere_enseigne', as: 'matiere_enseigne'
  post '/matiere_enseigne', to: 'pages#create_matiere_enseigne', as: 'create_matiere_enseigne'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
