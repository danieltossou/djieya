class Disponibilite < ApplicationRecord
  has_many :creneaus
  belongs_to :creneau
  belongs_to :enseignant
  belongs_to :jour
  belongs_to :ecole

end
