json.extract! dossier, :id, :libelle, :ecole_id, :created_at, :updated_at
json.url dossier_url(dossier, format: :json)
