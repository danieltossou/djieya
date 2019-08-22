class Dossier < ApplicationRecord
  belongs_to :ecole
  has_and_belongs_to_many :etudiants
end
