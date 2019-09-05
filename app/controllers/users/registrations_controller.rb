# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  skip_before_action :est_connecte?, only: [:new, :create]
  # GET /resource/sign_up
  def new
    super
  end

  # POST /resource
  def create
    # super
    # Si c'est l'admin qui crèe
    if current_admin
      @user = current_admin.users.new(user_params)
    else
      @user = User.new(user_params)    
    end

    if @user.save
      #sign_in(@user) # On connecte l'utilisateur lors de l'inscription
      redirect_to users_path, notice: 'Inscription effectué avec succes.'
    else
      render :new
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

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
    if current_user
      params[:user][:crea_user] = current_user.id
    end
    params[:user][:ecole_id] = ecole.id if ecole?
    params.require(:user).permit(:nom, :prenom, :adresse, :contact, :sexe, :matricule, :etat, :categorie, :ecole_id, :admin_id, :crea_user, :email, :password, :password_confirmation)
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nom, :prenom, :adresse, :contact, :sexe ,:matricule, :etat, :categorie, :ecole_id, :admin_id])
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    '/users/sign_in'
  end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
