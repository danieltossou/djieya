class Etudiant < ApplicationRecord
  belongs_to :classe_room
  belongs_to :ecole
  has_one :inscription
  has_many :versements
  has_and_belongs_to_many :dossiers

  mount_uploader :photo, PhotoUploader

  after_create do
    @etudiant = Etudiant.last
    @montant = @etudiant.classe_room.montant
    @annee = 1
    Inscription.create(etudiant_id: @etudiant.id, user_id: @etudiant.user_id, annee_id: @annee, classe_room_id: @etudiant.classe_room_id, ecole_id: @etudiant.ecole_id, montant: @montant)
  end


end
