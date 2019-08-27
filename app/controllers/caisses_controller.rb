class CaissesController < ApplicationController
  before_action :set_caiss, only: [:show, :edit, :update, :destroy]

  # GET /caisses
  # GET /caisses.json
  def index
    @annee = 1
    @ecole = 1
    @inscrits = Inscription.where(annee_id: @annee).where(ecole_id: @ecole).all
    # Montant qui doit etre perçus en rapport avec les inscrit
    @avoir = 0
    @inscrits.each do |inscris|
      @avoir +=  inscris.montant
    end

    # Montant déjà perçu
    @versements = Versement.where(annee_id: @annee).where(ecole_id: @ecole).all
    @deja_perçu = 0
    @versements.each do |versement|
      @deja_perçu += versement.montant
    end

    # Montant qui reste a percevoir
    @reste = @avoir - @deja_perçu

    # Total des depenses
    @depense = 0
    @sorties = Caisse.where(annee_id: @annee).where(ecole_id: @ecole).sortie.all
    @sorties.each do |sortie|
      @depense += sortie.montant
    end

    # Solde 
    @solde = @deja_perçu - @depense


  end

  # GET /caisses/1
  # GET /caisses/1.json
  def show
  end

  # GET /caisses/new
  def new
    @caiss = Caisse.new
  end

  # GET /caisses/1/edit
  def edit
  end

  # POST /caisses
  # POST /caisses.json
  def create
    if current_admin
      @caiss = current_admin.caisses.new(caisse_params)
    elsif current_user
      @caiss = current_user.caisses.new(caisse_params)
    else
      redirect_to new_caisse_path, notice: 'Vous devez etre connecté pour effectuer cette operation.' 
    end

    respond_to do |format|
      if @caiss.save
        format.html { redirect_to @caiss, notice: 'Caisse was successfully created.' }
        format.json { render :show, status: :created, location: @caiss }
      else
        format.html { render :new }
        format.json { render json: @caiss.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /caisses/1
  # PATCH/PUT /caisses/1.json
  def update
    respond_to do |format|
      if @caiss.update(caiss_params)
        format.html { redirect_to @caiss, notice: 'Caisse was successfully updated.' }
        format.json { render :show, status: :ok, location: @caiss }
      else
        format.html { render :edit }
        format.json { render json: @caiss.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /caisses/1
  # DELETE /caisses/1.json
  def destroy
    @caiss.destroy
    respond_to do |format|
      format.html { redirect_to caisses_url, notice: 'Caisse was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def depenses
    @depenses = Caisse.sortie.all
  end

  def depense_new
    @caisse = Caisse.new
  end

  def depense_create
    params[:caisse][:operation] = 'depense'
    Caisse.create(montant: params[:caisse][:montant], libelle: params[:caisse][:libelle], operation: 'depense', user_id: current_user.id, ecole_id: params[:caisse][:ecole_id], annee_id: params[:caisse][:annee_id])
    # current_user.caisses.create(params.require(:caisse).permit(:montant, :libelle, :operation, :user_id, :ecole_id, :annee_id))
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_caiss
      @caiss = Caisse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def caiss_params
      params.require(:caiss).permit(:montant, :libelle, :operation, :user_id, :ecole_id, :annee_id)
    end
end
