class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :timeoutable,
         :recoverable, :rememberable, :validatable
         
  has_many :annees
  has_many :ecoles
  has_many :classeRooms
  has_many :dossiers
  has_many :etudiants
  has_many :versements
  has_many :caisses
  has_many :matieres
  has_many :salles
  has_many :enseignants
  has_many :jours
  has_many :heures
  # belongs_to :admin

  #after_create do
  #  @user = User.last
  #  @id = @user.id.to_s
  #  @date = Time.now.strftime("%Y").to_s
  #  @nom = @user.nom[0].to_s
  #  @prenom = @user.prenom[0].to_s
  #  @matricule = @date+'-'+@id+'-'+@nom+''+@prenom
  #  @user.update(matricule: @matricule)
  #end
  
end
