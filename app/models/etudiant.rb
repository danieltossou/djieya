class Etudiant < ApplicationRecord
  belongs_to :classe_room
  belongs_to :ecole
  has_one :inscription
  has_and_belongs_to_many :dossiers

  mount_uploader :photo, PhotoUploader

  after_create do

    @etudiant = Etudiant.last
    # Generation d'un numero d'inscription automatique
    @id = @etudiant.id.to_s
    @date = Time.now.strftime("%Y").to_s
    @nom = @etudiant.nom[0].to_s
    @prenom = @etudiant.prenom[0].to_s
    @num_inscr = @date+'-'+@id+'-'+@nom+''+@prenom
    @etudiant.update(num_inscription: @num_inscr)

    #
    @montant = @etudiant.classe_room.montant
    @annee = 1
    Inscription.create(etudiant_id: @etudiant.id, user_id: @etudiant.user_id, annee_id: @annee, classe_room_id: @etudiant.classe_room_id, ecole_id: @etudiant.ecole_id, montant: @montant)
  end


end
