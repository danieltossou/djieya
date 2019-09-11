class Inscription < ApplicationRecord
  belongs_to :user
  belongs_to :etudiant
  belongs_to :annee
  belongs_to :classe_room
  belongs_to :ecole

  scope :annee, -> (annee) { where(annee_id: annee) }
  scope :ecole, -> (ecole) { where(ecole_id: ecole) }
  
end
