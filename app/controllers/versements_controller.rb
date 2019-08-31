class VersementsController < ApplicationController
  before_action :set_etudiant, only: [:etudiant_index, :etudiant_show, :etudiant_new, :etudiant_create, :etudiant_edit, :etudiant_update, :etudiant_destroy]
  before_action :set_versement, only: [:show, :edit, :update, :destroy, :etudiant_edit, :etudiant_update]
  load_and_authorize_resource
  
  # GET /versements
  # GET /versements.json
  def index
    @versements = Versement.all
  end

  # GET /versements/1
  # GET /versements/1.json
  def show
  end

  # GET /versements/new
  def new
    @versement = Versement.new
  end

  # GET /versements/1/edit
  def edit
  end

  # POST /versements
  # POST /versements.json
  def create
    if current_admin
      @versement = current_admin.versements.new(eversement_params)
    elsif current_user
      @versement = current_user.versements.new(versement_params)
    else
      redirect_to new_versement_path, notice: 'Vous devez etre connecté pour effectuer cette operation.' 
    end

    respond_to do |format|
      if @versement.save

        @libelle = "Versement de l'etudiant #{@versement.etudiant.nom} #{@versement.etudiant.prenom} ( #{@versement.etudiant.num_inscription})"
        Caisse.create!(montant: @versement.montant, libelle: @libelle, operation: 'entrée', ecole_id: @versement.ecole_id, annee_id: @versement.annee_id, user_id: current_user.id)
        
        format.html { redirect_to @versement, notice: 'Versement was successfully created.' }
        format.json { render :show, status: :created, location: @versement }
      else
        format.html { render :new }
        format.json { render json: @versement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /versements/1
  # PATCH/PUT /versements/1.json
  def update
    respond_to do |format|
      if @versement.update(versement_params)
        format.html { redirect_to @versement, notice: 'Versement was successfully updated.' }
        format.json { render :show, status: :ok, location: @versement }
      else
        format.html { render :edit }
        format.json { render json: @versement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /versements/1
  # DELETE /versements/1.json
  def destroy
    @versement.destroy
    respond_to do |format|
      format.html { redirect_to versements_url, notice: 'Versement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # Versement d'un seul etudiant

  # GET /etudiants/1/versements/
  # GET /etudiants/1/versements.json
  def etudiant_index
    @versements = Versement.where(etudiant_id: params[:etudiant_id])
  end

  # GET /etudiants/1/versements/1
  # GET /etudiants/1/versements/1.json
  def etudiant_show
  end

  # GET /etudiants/1/versements/new
  def etudiant_new
    @versement = @etudiant.versements.build
  end

  # GET /etudiants/1/versements/1/edit
  def etudiant_edit
  end

  # POST /etudiants/1/versements
  # POST /etudiants/1/versements.json
  def etudiant_create
    @versement = @etudiant.versements.new(etudiant_versement_params)

    respond_to do |format|
      if @versement.save

        puts @libelle = "Versement de l'etudiant #{@versement.etudiant.nom} #{@versement.etudiant.prenom} ( #{@versement.etudiant.num_inscription})"
        Caisse.create!(montant: @versement.montant, libelle: @libelle, operation: 'entrée', ecole_id: @versement.ecole_id, annee_id: @versement.annee_id, user_id: current_user.id)
        
        format.html { redirect_to @versement, notice: 'Versement was successfully created.' }
        format.json { render :show, status: :created, location: @versement }
      else
        format.html { render :new }
        format.json { render json: @versement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /etudiants/1/versements/1
  # PATCH/PUT /etudiants/1/versements/1.json
  def etudiant_update
    respond_to do |format|
      if @versement.update(etudiant_versement_params)
        format.html { redirect_to etudiant_versements_path(@etudiant), notice: 'Versement was successfully updated.' }
        format.json { render :show, status: :ok, location: @versement }
      else
        format.html { render :edit }
        format.json { render json: @versement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /etudiants/1/versements/1
  # DELETE /etudiants/1/versements/1.json
  def etudiant_destroy
    @versement.destroy
    respond_to do |format|
      format.html { redirect_to versements_url, notice: 'Versement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_versement
      @versement = Versement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def versement_params
      params.require(:versement).permit(:montant, :user_id, :ecole_id, :annee_id, :etudiant_id)
    end

  
    def set_etudiant
      @etudiant = Etudiant.find(params[:etudiant_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def etudiant_versement_params
      params[:versement][:user_id] = current_user.id
      params.require(:versement).permit(:montant, :user_id, :ecole_id, :annee_id, :etudiant_id)
    end
end
