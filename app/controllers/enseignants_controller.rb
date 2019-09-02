class EnseignantsController < ApplicationController
  before_action :set_enseignant, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  
  # GET /enseignants
  # GET /enseignants.json
  def index
    @enseignants = Enseignant.all
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

    if current_admin
      @enseignant = current_admin.enseignants.new(enseignant_params)
    elsif current_user
      @enseignant = current_user.enseignants.new(enseignant_params)
    else
      redirect_to new_enseignant_path, notice: 'Vous devez etre connecté pour effectuer cette operation.' 
    end

    respond_to do |format|
      if @enseignant.save
        format.html { redirect_to @enseignant, notice: 'Enseignant was successfully created.' }
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
        format.html { redirect_to @enseignant, notice: 'Enseignant was successfully updated.' }
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enseignant
      @enseignant = Enseignant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def enseignant_params
      params[:enseignant][:ecole_id] = ecole.id if ecole?
      params.require(:enseignant).permit(:nom, :prenom, :sexe, :contact, :email, :adresse, :ecole_id, :user_id, :admin_id, matiere_ids: [])
    end
end
