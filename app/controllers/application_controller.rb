class ApplicationController < ActionController::Base

  # Message d'erreur lorsqu'on accède aux interdits
    rescue_from CanCan::AccessDenied do |exception|
        respond_to do |format|
          format.json { head :forbidden, content_type: 'text/html' }
          format.html { redirect_to main_app.root_url, notice: 'Vous n\'avez pas le droit d\'effectuer cette action' }
          format.js   { head :forbidden, content_type: 'text/html' }
        end
      end


end
