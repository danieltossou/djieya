# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  #before_action :configure_sign_in_params, only: [:create]
  after_action :save_session, only: [:create]
  skip_before_action :est_connecte?, only: [:new, :create]

  # Mise à jour de la presence
  after_action :update_presence_true, only: [:create] 
  before_action :update_presence_false, only: [:destroy]
  
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    self.resource = warden.authenticate!(auth_options)
    def is_active?
      self.resource.etat
    end

    if is_active?
      puts "Activer"
      set_flash_message!(:notice, :signed_in)
      sign_in(resource_name, resource)
      yield resource if block_given?
      respond_with resource, location: after_sign_in_path_for(resource)
    else
      puts "Desactiver"
      sign_out
      redirect_to user_session_path, notice: "Désolé votre compte à été desactiver"
    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #  super
  # end

  # Enregistremenyt de la session
  def save_session
    session[:ecole_id] = current_user.ecole_id
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  def update_presence_true
    current_user.update(presence: true, date_derniere_connexion: Time.now.utc)
  end

  def update_presence_false
    current_user.update(presence: false, date_derniere_deconnexion: Time.now.utc)
  end


end
