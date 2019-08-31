json.extract! matiere, :id, :libelle, :ecole_id, :user_id, :admin_id, :created_at, :updated_at
json.url matiere_url(matiere, format: :json)
