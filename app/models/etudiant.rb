class Etudiant < ApplicationRecord
  belongs_to :classe_room
  belongs_to :ecole
  has_one :inscription
  has_many :versements
  has_and_belongs_to_many :dossiers

  paginates_per 5

  default_scope { order(nom: :asc) }
  scope :ecole, -> (ecole) { where(ecole_id: ecole) }

  mount_uploader :photo, PhotoUploader

  after_create do
    @etudiant = Etudiant.unscope(:order).last
    @montant = @etudiant.classe_room.montant
    @a = Annee.where(etat: true).first
    @annee = @a.id
    Inscription.create(etudiant_id: @etudiant.id, user_id: @etudiant.user_id, admin_id: @etudiant.admin_id, annee_id: @annee, classe_room_id: @etudiant.classe_room_id, ecole_id: @etudiant.ecole_id, montant: @montant)
  end


end
