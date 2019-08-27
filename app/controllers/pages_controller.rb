class PagesController < ApplicationController
  def index
  end

  def users
    @users = User.all
  end

  def user 
    @user = User.find(params[:id])
  end

  def activer
    @user = User.find(params[:id])
    @user.update(etat: true)
  end

  def desactiver
    @user = User.find(params[:id])
    @user.update(etat: false)
  end

  def employes
  end

  def menu_annees
  end
  
  def menu_classes
    
  end
  
  def matiere_enseigne
    @matieres = Matiere.all
    @enseignants = Enseignant.all
  end
  
  def create_matiere_enseigne
    puts params[:enseignant].inspect
  end
  
end
