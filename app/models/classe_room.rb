class ClasseRoom < ApplicationRecord
  belongs_to :user
  belongs_to :ecole
  has_many :etudiants
end
