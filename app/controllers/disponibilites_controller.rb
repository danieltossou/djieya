class DisponibilitesController < ApplicationController
  before_action :set_disponibilite, only: [:show, :edit, :update, :destroy]
  before_action :autorisation

  # GET /disponibilites
  # GET /disponibilites.json
  def index
    @ecole = ecole.id if ecole?
    @disponibilites = Disponibilite.ecole(@ecole).all.page(params[:page])
    @disponibilite = Disponibilite.new
  end

  # GET /disponibilites/1
  # GET /disponibilites/1.json
  def show
  end

  # GET /disponibilites/new
  def new
    @disponibilite = Disponibilite.new
  end

  # GET /disponibilites/1/edit
  def edit
  end

  # POST /disponibilites
  # POST /disponibilites.json
  def create

    if !params[:disponibilite][:creneau_ids].nil?

      Disponibilite.where(enseignant_id: params[:disponibilite][:enseignant_id]).where(jour_id: params[:disponibilite][:jour_id]).where(ecole_id: ecole.id).destroy_all

      params[:disponibilite][:creneau_ids].each do |creneau|
        Disponibilite.create(enseignant_id: params[:disponibilite][:enseignant_id], jour_id: params[:disponibilite][:jour_id], user_id: current_user.id, ecole_id: ecole.id, creneau_id: creneau)
      end
      redirect_to disponibilites_url
      #@disponibilite = current_user.disponibilites.new(disponibilite_params)
    else
      redirect_to new_disponibilite_path, notice: "Veuillez choisir des heures pour la disponibilité du prof"
    end

  end

  # PATCH/PUT /disponibilites/1
  # PATCH/PUT /disponibilites/1.json
  def update
    respond_to do |format|
      if @disponibilite.update(disponibilite_params)
        format.html { redirect_to @disponibilite, notice: 'Disponibilite was successfully updated.' }
        format.json { render :show, status: :ok, location: @disponibilite }
      else
        format.html { render :edit }
        format.json { render json: @disponibilite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /disponibilites/1
  # DELETE /disponibilites/1.json
  def destroy
    @disponibilite.destroy
    respond_to do |format|
      format.html { redirect_to disponibilites_url, notice: 'Disponibilite was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_disponibilite
      @disponibilite = Disponibilite.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def disponibilite_params
      params[:disponibilite][:ecole_id] = ecole.id if ecole?
      params.require(:disponibilite).permit(:enseignant_id, :jour_id, :user_id, :ecole_id, creneau_ids: [])
    end

    # Redirection à la page d'acceuil si il n'a pas le droit
    def autorisation
      redirect_to root_path, alert: "Vous n'avez pas le droit d'effectué cette action" if !can_disponibilite?
    end
end
