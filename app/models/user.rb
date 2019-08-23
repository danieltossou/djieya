class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :classeRooms
  has_many :dossiers
  has_many :etudiants
  # belongs_to :admin

  after_create do
    @user = User.last
    @id = @user.id.to_s
    @date = Time.now.strftime("%Y").to_s
    @nom = @user.nom[0].to_s
    @prenom = @user.prenom[0].to_s
    puts @matricule = @date+'-'+@id+'-'+@nom+''+@prenom
    @user.update(matricule: @matricule)
  end
end
