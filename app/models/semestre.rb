class Semestre < ApplicationRecord
  belongs_to :ecole
  
  default_scope { order(libelle: :asc) }
  scope :ecole, -> (ecole) {where(ecole_id: ecole)}
end
