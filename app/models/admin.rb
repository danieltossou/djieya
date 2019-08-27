class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :annees
  has_many :ecoles
  has_many :users
  has_many :matieres
  has_many :salles
  has_many :enseignants
  has_many :jours
  has_many :heures
  has_many :caisses
  has_many :classeRooms
  has_many :dossiers
  has_many :etudiants
end
