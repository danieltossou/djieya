class Enseignant < ApplicationRecord
  belongs_to :ecole
  has_and_belongs_to_many :matieres

  default_scope { order(nom: :asc) }
  scope :ecole, -> (ecole) { where(ecole_id: ecole) }
end
