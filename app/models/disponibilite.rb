class Disponibilite < ApplicationRecord
  belongs_to :user
  has_many :creneaus
  belongs_to :creneau
  belongs_to :enseignant
  belongs_to :jour
  belongs_to :ecole

  scope :ecole, -> (ecole) { where(ecole_id: ecole) }
end
