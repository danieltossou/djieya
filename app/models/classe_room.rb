class ClasseRoom < ApplicationRecord
  belongs_to :user
  belongs_to :ecole
  has_many :etudiants
  has_and_belongs_to_many :matieres

  default_scope { order(libelle: :asc) }
  scope :ecole, -> (ecole) { where(ecole_id: ecole) }
end
