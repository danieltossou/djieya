class Matiere < ApplicationRecord
  belongs_to :ecole
  has_and_belongs_to_many :enseignants
  has_and_belongs_to_many :classe_rooms

  default_scope { order(libelle: :asc) }
  scope :ecole, -> (ecole) { where(ecole_id: ecole) }
end
