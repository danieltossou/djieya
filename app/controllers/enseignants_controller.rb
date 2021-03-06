class EnseignantsController < ApplicationController
  before_action :set_enseignant, only: [:show, :edit, :update, :destroy]
  #load_and_authorize_resource
  before_action :autorisation
  
  # GET /enseignants
  # GET /enseignants.json
  def index
    @ecole = ecole.id if ecole?
    @enseignants = Enseignant.ecole(@ecole).all.page(params[:page])
    @enseignant = Enseignant.new
  end

  # GET /enseignants/1
  # GET /enseignants/1.json
  def show
  end

  # GET /enseignants/new
  def new
    @enseignant = Enseignant.new
  end

  # GET /enseignants/1/edit
  def edit
  end

  # POST /enseignants
  # POST /enseignants.json
  def create

    @enseignant = current_user.enseignants.new(enseignant_params)

    respond_to do |format|
      if @enseignant.save
        format.html { redirect_to enseignants_url, notice: 'Enseignant was successfully created.' }
        format.json { render :show, status: :created, location: @enseignant }
      else
        format.html { render :new }
        format.json { render json: @enseignant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /enseignants/1
  # PATCH/PUT /enseignants/1.json
  def update
    respond_to do |format|
      if @enseignant.update(enseignant_params)
        format.html { redirect_to enseignants_url, notice: 'Enseignant was successfully updated.' }
        format.json { render :show, status: :ok, location: @enseignant }
      else
        format.html { render :edit }
        format.json { render json: @enseignant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enseignants/1
  # DELETE /enseignants/1.json
  def destroy
    @enseignant.destroy
    respond_to do |format|
      format.html { redirect_to enseignants_url, notice: 'Enseignant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
    @ecole = ecole.id if ecole?
    @search = params[:id_search]
    @enseignants = Enseignant.where('nom LIKE ?', "%#{@search}%").or(Enseignant.where('prenom LIKE ?', "%#{@search}%")).or(Enseignant.where(contact: @search)).or(Enseignant.where('email LIKE ?', "%#{@search}%")).ecole(@ecole).all

    if request.xhr?
      render :partial => 'enseignants', locals: {:enseignants => @enseignants}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enseignant
      @enseignant = Enseignant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def enseignant_params
      params[:enseignant][:ecole_id] = ecole.id if ecole?
      params.require(:enseignant).permit(:nom, :prenom, :sexe, :contact, :email, :adresse, :ecole_id, :user_id, matiere_ids: [])
    end

    # Redirection à la page d'acceuil si il n'a pas le droit
    def autorisation
      redirect_to root_path, alert: "Vous n'avez pas le droit d'effectué cette action" if !can_enseignant?
    end
end
