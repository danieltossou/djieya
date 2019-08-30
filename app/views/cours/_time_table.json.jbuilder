json.extract! cour, :id, :enseignant_id, :matiere_id, :classe_room_id, :salle_id, :creneau_id, :jour_id, :nombre_heure, :numero_cours, :numero_cours_g, :annee_id, :ecole_id, :semestre_id, :user_id, :admin_id, :created_at, :updated_at
json.url cour_url(cour, format: :json)
