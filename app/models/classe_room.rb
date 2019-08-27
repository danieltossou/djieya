class ClasseRoom < ApplicationRecord
  belongs_to :user
  belongs_to :ecole
  has_many :etudiants
  has_and_belongs_to_many :matieres
end
