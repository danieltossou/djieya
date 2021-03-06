class PagesController < ApplicationController
  before_action :autorisation
  skip_before_action :autorisation, only: [:dashboard]

  def index
  end

  def new_user
    authorize! :new_user, :pages
    @user = User.new
  end

  def create_user
    authorize! :create_user, :pages

    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path, notice: 'Utilisateur was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new_user }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def users
    
    authorize! :users, :pages

    @ecole = ecole.id if ecole?

    if current_user.categorie == "Admin"
      @users = User.ecole(@ecole).all.page(params[:page])
    elsif user_signed_in?
      @users = User.ecole(@ecole).where.not(categorie: 'Directeur').all.page(params[:page])
    end
  end

  def user 
    
    authorize! :user, :pages

    @user = User.find(params[:id])
  end

  def edit_user
    authorize! :edit_user, :pages
    
      @user = User.find_by_id(params[:id])
  end

      
  def activer

    authorize! :activer, :pages

    @user = User.find(params[:id])
    @user.update(etat: true)

    respond_to do |format|
      format.html { redirect_to users_path, notice: "compte de #{@user.nom} #{@user.prenom} activer avec succès" }
    end
  end

  def desactiver

    authorize! :desactiver, :pages

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

    authorize! :matiere_enseigne, :pages

    @matieres = Matiere.all
    @enseignants = Enseignant.all

  end
  
  def create_matiere_enseigne

    authorize! :create_matiere_enseigne, :pages

    params[:enseignant].inspect

  end

  def commencer
    
  end

  def configuration
    
  end

  def dashboard
    
    authorize! :dashboard, :pages

    @annee = annee_active.id if annee_active?
    @ecole = ecole.id if ecole?
    @inscrits = Inscription.annee(@annee).ecole(@ecole).all

    # Montant qui doit etre perçus en rapport avec les inscrit
    @avoir = 0
    @inscrits.each do |inscris|
      @avoir +=  inscris.montant
    end

    # Montant déjà perçu
    @versements = Versement.annee(@annee).ecole(@ecole).all
    @deja_perçu = 0
    @versements.each do |versement|
      @deja_perçu += versement.montant
    end

    # Montant qui reste a percevoir
    @reste = @avoir - @deja_perçu

    # Total des depenses
    @depense = 0
    @sorties = Caisse.annee(@annee).ecole(@ecole).sortie.all
    @sorties.each do |sortie|
      @depense += sortie.montant
    end

    # Solde 
    @solde = @deja_perçu - @depense

    # Total des inscrits
    @total_inscrits = Inscription.ecole(@ecole).annee(@annee).all.count

    # Total des salles
    @total_salles = Salle.ecole(@ecole).all.count

    # Total des classes
    @total_classes = ClasseRoom.ecole(@ecole).all.count

  end


  def search
    @ecole = ecole.id if ecole?
    @search = params[:id_search]
    @users = User.where('nom LIKE ?', "%#{@search}%").or(User.where('prenom LIKE ?', "%#{@search}%")).or(User.where('matricule LIKE ?', "%#{@search}%")).or(User.where(contact: @search)).ecole(@ecole).all

    if request.xhr?
      render :partial => 'users', locals: {:users => @users}
    end
  end

  def ecoles_liste
    @ecoles = Ecole.all
    @ecole = Ecole.new
  end

  def ecoles_liste_choix
    puts session[:ecole_id] = params[:ecole]
    redirect_to dashboard_path
  end
  
  def user_params

    if User.last == nil
      @last_user = 0
    else
      @last_user = User.last.id
    end
      @id = @last_user + 1
    @date = Time.now.strftime("%Y").to_s
    @nom = params[:user][:nom][0].to_s
    @prenom = params[:user][:prenom][0].to_s
    @matricule = @date+'-'+@id.to_s+'-'+@nom+''+@prenom
    params[:user][:matricule] = @matricule

    params[:user][:ecole_id] = ecole.id if ecole?
    if user_signed_in?
      params[:user][:crea_user] = current_user.id
    end
    params.require(:user).permit(:nom, :prenom, :fonction, :adresse, :contact, :sexe, :matricule, :etat, :categorie, :ecole_id, :crea_user, :email, :password, :password_confirmation)
  end


    # Redirection à la page d'acceuil si il n'a pas le droit
    def autorisation
      redirect_to root_path, alert: "Vous n'avez pas le droit d'effectué cette action" if !can_page?
    end
end
