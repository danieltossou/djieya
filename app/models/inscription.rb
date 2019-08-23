class Inscription < ApplicationRecord
  belongs_to :etudiant
  belongs_to :user
  belongs_to :annee
  belongs_to :classe_room
  belongs_to :ecole
end
