class ApplicationController < ActionController::Base

  before_action :authenticate_user!

  helper_method :annee_active, :annee_active?, :ecole, :ecole?, :Admin?, :can_tableau_board?, :can_utilisateur?, :can_etudiant?, :can_versement?, :can_caisse?, :can_matiere?, :can_classe_room?, :can_dossier?, :can_salle?, :can_semestre?, :can_enseignant?, :can_creneau?, :can_disponibilite?, :can_cour?, :can_droit?, :can_jour?, :can_page?,

  def Admin?
    return true if current_user.categorie == "Admin"
  end

    # Recuperation de l'année active
  def annee_active
    Annee.where(etat: true).first ? Annee.where(etat: true).first : nil
  end

  def annee_active?
    !annee_active.nil?
  end

  # Recuperation de l'ecole
  def ecole
    Ecole.find_by_id(session[:ecole_id]) ? Ecole.find_by_id(session[:ecole_id]) : nil
  end

  def ecole?
    !ecole.nil?
  end

  # Gestion des droits
  def can_tableau_board?
    return true if Admin?
    current_user.droit.tableau_board if current_user.droit
  end
  def can_utilisateur?
    return true if Admin?
    current_user.droit.utilisateur if current_user.droit
  end
  def can_etudiant?
    return true if Admin?
    current_user.droit.etudiant if current_user.droit
  end
  def can_versement?
    return true if Admin?
    current_user.droit.versement if current_user.droit
  end
  def can_caisse?
    return true if Admin?
    current_user.droit.caisse if current_user.droit
  end
  def can_matiere?
    return true if Admin?
    current_user.droit.matiere if current_user.droit
  end
  def can_classe_room?
    return true if Admin?
    current_user.droit.classe_room if current_user.droit
  end
  def can_dossier?
    return true if Admin?
    current_user.droit.dossier if current_user.droit
  end
  def can_salle?
    return true if Admin?
    current_user.droit.salle if current_user.droit
  end
  def can_semestre?
    return true if Admin?
    current_user.droit.semestre if current_user.droit
  end
  def can_enseignant?
    return true if Admin?
    current_user.droit.enseignant if current_user.droit
  end
  def can_creneau?
    return true if Admin?
    current_user.droit.creneau if current_user.droit
  end
  def can_jour?
    return true if Admin?
    current_user.droit.jour if current_user.droit
  end
  def can_disponibilite?
    return true if Admin?
    current_user.droit.disponibilite if current_user.droit
  end
  def can_cour?
    return true if Admin?
    current_user.droit.cour if current_user.droit
  end
  def can_droit?
    return true if Admin?
    current_user.droit.droit if current_user.droit
  end
  def can_page?
    return true if Admin?
    current_user.droit.page if current_user.droit
  end
  


  # Message d'erreur lorsqu'on accède aux interdits
    rescue_from CanCan::AccessDenied do |exception|
        respond_to do |format|
          format.json { head :forbidden, content_type: 'text/html' }
          format.html { redirect_to root_url, notice: 'Vous n\'avez pas le droit d\'effectuer cette action' }
          format.js   { head :forbidden, content_type: 'text/html' }
        end
      end
   
 
end
