json.extract! salle, :id, :libelle, :ecole_id, :user_id, :admin_id, :created_at, :updated_at
json.url salle_url(salle, format: :json)
