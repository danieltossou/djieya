class Versement < ApplicationRecord
  belongs_to :user
  belongs_to :ecole
  belongs_to :annee
  belongs_to :etudiant

end
