class Cour < ApplicationRecord
  belongs_to :user
  belongs_to :enseignant
  belongs_to :matiere
  belongs_to :classe_room
  has_many :classe_rooms
  belongs_to :salle
  belongs_to :creneau
  belongs_to :jour
  belongs_to :annee
  belongs_to :ecole
  belongs_to :semestre
end
