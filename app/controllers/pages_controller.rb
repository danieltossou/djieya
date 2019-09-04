class PagesController < ApplicationController
  #authorize_resource :class => pages
  skip_before_action :est_connecte?, on: :index
  before_action :user_params, only: [:create_user] 

  def index
  end

  def new_user
    @user = User.new
  end

  def create_user
    puts user_params.inspect
    if admin_signed_in?
      @user = current_admin.users.new(user_params)
    elsif user_signed_in?
      @user = User.new(user_params)
    else
      redirect_to root_path, notice: 'Vous devez etre connecté pour effectuer cette operation.' 
    end 

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'Utilisateur was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
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
    params[:enseignant].inspect
  end

  def commencer
    
  end

  def configuration
    
  end

  def dashboard
    
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
    params.require(:user).permit(:nom, :prenom, :adresse, :contact, :sexe, :matricule, :etat, :categorie, :ecole_id, :admin_id, :crea_user, :email, :password, :password_confirmation)
  end

end
