Rails.application.routes.draw do
      
  resources :droits
  devise_scope :user do    
    authenticated :user do
      root :to => 'pages#dashboard'
      #delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_all_session
    end
    unauthenticated :user do
      root :to => 'users/sessions#new', as: :unauthenticated_root
    end
  end

  resources :cours do
    collection do
      get 'matieres', to: 'cours#matieres'
      get 'enseignants', to: 'cours#enseignants'
      get 'salles', to: 'cours#salles'
    end
  end
  resources :semestres do
    collection do
      get 'search', to: 'semestres/search'
    end
  end
  resources :disponibilites
  resources :creneaus do
    collection do
      get 'search', to: 'creneaus/search'
    end
  end
  resources :heures
  resources :jours do
    collection do
      get 'search', to: 'jours/search'
    end
  end
  resources :enseignants do
    collection do
      get 'search', to: 'enseignants/search'
    end
  end
  resources :salles do
    collection do
      get 'search', to: 'salles/search'
    end
  end
  resources :matieres do
    collection do
      get 'search', to: 'matieres/search'
    end
  end
  resources :caisses do
    collection do
      get 'depense_new'
      get 'depenses'
      post 'depense_create'
    end
  end
  resources :versements

  resources :inscriptions
  
  resources :etudiants do
    collection do
      get 'search', to: 'etudiants/search'
      get 'fiche_inscription/:id', to: 'etudiants#fiche_inscription', as: 'fiche_inscription', defaults: { format: 'pdf' }
    end
  end
  
  # Routes des versement d'un etudiant
    get 'etudiants/:etudiant_id/versements', to: 'versements#etudiant_index', as: 'etudiant_versements'
    get 'etudiants/:etudiant_id/versements/new', to: 'versements#etudiant_new', as: 'new_etudiant_versement'
    post 'etudiants/:etudiant_id/versements', to: 'versements#etudiant_create', as: 'create_etudiant_versement'
    get '/etudiants/:etudiant_id/versements/:id/edit', to: 'versements#etudiant_edit', as: 'edit_etudiant_versement'
    get '/etudiants/:etudiant_id/versements/:id', to: 'versements#etudiant_show', as: 'show_etudiant_versement'
    patch '/etudiants/:etudiant_id/versements/:id', to: 'versements#etudiant_update', as: 'update_etudiant_versement'
    put '/etudiants/:etudiant_id/versements/:id', to: 'versements#etudiant_update'
    delete '/etudiants/:etudiant_id/versements/:id', to: 'versements#etudiant_destroy'

  resources :dossiers do
    collection do
      get 'search', to: 'dossiers/search'
    end
  end
  resources :classe_rooms do
    collection do
      get 'search', to: 'classe_rooms/search'
    end
  end
  resources :ecoles
  resources :annees do
    collection do
      get 'search', to: 'annees/search'
    end
  end
  devise_for :users, path: 'users', controllers: { registrations: 'users/registrations', sessions:'users/sessions' }

  #root to: 'pages#index'
  get 'new_user', to: 'pages#new_user', as: 'new_user'
  post 'create_user', to: 'pages#create_user', as: 'create_user'
  get 'users', to: 'pages#users', as: 'users'
  get 'pages/search', to: 'pages#search'
  get 'users/:id/edit', to: 'pages#edit_user', as: 'edit_user'
  get 'users/:id', to: 'pages#user', as: 'user'
  put 'users/:id', to: 'pages#activer', as: 'activer'
  patch 'users/:id', to: 'pages#desactiver', as: 'desactiver'
  get '/employes', to: 'pages#employes'
  get '/menu_annees', to: 'pages#menu_annees'
  get '/menu_classes', to: 'pages#menu_classes'
  get '/commencer', to: 'pages#commencer'
  get '/configuration', to: 'pages#configuration'
  get '/dashboard', to: 'pages#dashboard'
  get '/matiere_enseigne', to: 'pages#matiere_enseigne', as: 'matiere_enseigne'
  post '/matiere_enseigne', to: 'pages#create_matiere_enseigne', as: 'create_matiere_enseigne'
  get '/ecoles_liste', to: 'pages#ecoles_liste'
  post '/ecoles_liste_choix', to: 'pages#ecoles_liste_choix'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #Snotify_to :users, with_devise: :users, devise_default_routes: true


end
