json.extract! etudiant, :id, :nom, :prenom, :sexe, :date_naissance, :matricule, :num_inscription, :classe_room_id, :oriente, :nationnalite, :email, :adresse, :contact, :maladie, :nom_parent, :contact_parent, :lien_parente, :email_parent, :photo, :autre, :ecole_id, :created_at, :updated_at
json.url etudiant_url(etudiant, format: :json)
