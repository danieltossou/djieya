class PagesController < ApplicationController
  #authorize_resource :class => pages
  skip_before_action :est_connecte?, on: :index

  def index
  end

  def users
    @ecole = ecole.id if ecole?

    if admin_signed_in?
      @users = User.ecole(@ecole)
    elsif user_signed_in?
      @users = User.ecole(@ecole).where.not(categorie: 'Directeur')
    end
  end

  def user 
    @user = User.find(params[:id])
  end

  def activer
    @user = User.find(params[:id])
    @user.update(etat: true)

    respond_to do |format|
      format.html { redirect_to users_path, notice: "compte de #{@user.nom} #{@user.prenom} activer avec succès" }
    end
  end

  def desactiver
    @user = User.find(params[:id])
    @user.update(etat: false)

    respond_to do |format|
      format.html { redirect_to users_path, notice: "compte de #{@user.nom} #{@user.prenom} desactiver avec succès" }
    end

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

  def commencer
    
  end

  def configuration
    
  end

  def dashboard
    
  end
  

end
