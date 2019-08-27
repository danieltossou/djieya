class Matiere < ApplicationRecord
  belongs_to :ecole
  has_and_belongs_to_many :enseignants
  has_and_belongs_to_many :classe_rooms
end
