class ApplicationController < ActionController::Base

  
  before_action :est_connecte?
  helper_method :annee_active, :annee_active?, :ecole, :ecole?



    # Recuperation de l'année active
  def annee_active
    Annee.where(etat: true).first ? Annee.where(etat: true).first : nil
  end

  def annee_active?
    !annee_active.nil?
  end

    # Recuperation de l'ecole
    def ecole
      Ecole.find_by_id(session[:ecole_id]) ? Ecole.find(session[:ecole_id]) : nil
    end
  
    def ecole?
      !ecole.nil?
    end

  #Verification si quelqu'un n'est pas connecté
  def est_connecte?
    if !current_user && !current_admin 
      redirect_to root_path, danger: "Vous n'avez pas le droit d'accéder à cette page"
    end
  end

  # Message d'erreur lorsqu'on accède aux interdits
    rescue_from CanCan::AccessDenied do |exception|
        respond_to do |format|
          format.json { head :forbidden, content_type: 'text/html' }
          format.html { redirect_to main_app.root_url, notice: 'Vous n\'avez pas le droit d\'effectuer cette action' }
          format.js   { head :forbidden, content_type: 'text/html' }
        end
      end

      private
      
      def current_ability
      @current_ability ||= Ability.new(current_user, current_admin)
      end
    
 
end
