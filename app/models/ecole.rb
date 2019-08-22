class Ecole < ApplicationRecord
  belongs_to :admin
  has_many :etudiants
  has_many :users
end
