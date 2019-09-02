class Ability
  include CanCan::Ability


  def initialize(user, admin)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    
    if admin.present?
      can :manage, :all
    elsif user.present?
      can :read, [Annee, Ecole]
      can [:read, :create], [ClasseRoom, Enseignant, Etudiant, Heure, Inscription, Jour, Matiere, Salle, User, Versement]
      # can [:update, :destroy], [Caisse, ClasseRoom, Dossier, Enseignant, Etudiant, Heure, Inscription, Jour, Matiere, Salle, User, Versement], user_id = user.id
      can [:index, :users], :pages
      can [:read, :depenses, :depense_new, :depense_create], Caisse
      can [:etudiant_index, :etudiant_show, :etudiant_new, :etudiant_create], Versement
    else
      can :index, :pages
      can :create, :dossiers
    end
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
