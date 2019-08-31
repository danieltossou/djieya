json.extract! enseignant, :id, :nom, :prenom, :contact, :email, :adresse, :ecole_id, :user_id, :admin_id, :created_at, :updated_at
json.url enseignant_url(enseignant, format: :json)
