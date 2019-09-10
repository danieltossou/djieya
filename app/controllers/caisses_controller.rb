class CaissesController < ApplicationController
  before_action :set_caisse, only: [:show, :edit, :update, :destroy]
  
  # GET /caisses
  # GET /caisses.json
  def index
    authorize! :index, Caisse
    @annee = annee_active.id if annee_active?
    @ecole = ecole.id if ecole?

    @caisse = Caisse.new

    #Somme des entrées
    @entrées = Caisse.entrée
    @entrée = 0
    @entrées.each do |entrée|
      @entrée =+ entrée.montant
    end
    
    #Somme des sorties
    @sorties = Caisse.sortie
    @sortie = 0
    @sorties.each do |sortie|
      @sortie += sortie.montant
    end

    # Solde 
    @solde = @entrée - @sortie


  end

  # GET /caisses/1
  # GET /caisses/1.json
  def show
    authorize! :show, Caisse
  end

  # GET /caisses/new
  def new
    authorize! :new, Caisse
    @caisse = Caisse.new
  end

  # GET /caisses/1/edit
  def edit
    authorize! :edit, Caisse
  end

  # POST /caisses
  # POST /caisses.json
  def create
    authorize! :create, Caisse
    if current_admin
      @caisse = current_admin.caisses.new(caisse_params)
    elsif current_user
      @caisse = current_user.caisses.new(caisse_params)
    else
      redirect_to new_caisse_path, notice: 'Vous devez etre connecté pour effectuer cette operation.' 
    end

    respond_to do |format|
      if @caisse.save
        format.html { redirect_to @caisse, notice: 'Caisse was successfully created.' }
        format.json { render :show, status: :created, location: @caisse }
      else
        format.html { render :new }
        format.json { render json: @caisse.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /caisses/1
  # PATCH/PUT /caisses/1.json
  def update
    authorize! :update, Caisse
    respond_to do |format|
      if @caisse.update(caisse_params)
        format.html { redirect_to @caisse, notice: 'Caisse was successfully updated.' }
        format.json { render :show, status: :ok, location: @caisse }
      else
        format.html { render :edit }
        format.json { render json: @caisse.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /caisses/1
  # DELETE /caisses/1.json
  def destroy
    authorize! :destroy, Caisse
    @caisse.destroy
    respond_to do |format|
      format.html { redirect_to caisses_url, notice: 'Caisse was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def depenses
    authorize! :depenses, Caisse
    @depenses = Caisse.sortie.all.page(params[:page])
  end

  def depense_new
    authorize! :depense_new, Caisse
    @caisse = Caisse.new
  end

  def depense_create

    authorize! :depense_create, Caisse

    params[:caisse][:operation] = "sortie"
    params[:caisse][:ecole_id] = ecole.id if ecole?
    params[:caisse][:annee_id] = annee_active.id if annee_active?

    if admin_signed_in?
      @caisse = Caisse.new(montant: params[:caisse][:montant], libelle: params[:caisse][:libelle], operation: params[:caisse][:operation], admin_id: current_admin.id, ecole_id: params[:caisse][:ecole_id], annee_id: params[:caisse][:annee_id])
    elsif user_signed_in?
      @caisse = Caisse.new(montant: params[:caisse][:montant], libelle: params[:caisse][:libelle], operation: params[:caisse][:operation], user_id: current_user.id, ecole_id: params[:caisse][:ecole_id], annee_id: params[:caisse][:annee_id])
    else
      redirect_to new_caisse_path, notice: 'Vous devez etre connecté pour effectuer cette operation.'
    end

    respond_to do |format|
      if @caisse.save
        format.html { redirect_to caisses_url, notice: 'Caisse was successfully created.' }
        format.json { render :show, status: :created, location: @caisse }
      else
        format.html { render :new }
        format.json { render json: @caisse.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_caisse
      @caisse = Caisse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def caisse_params
      params[:caisse][:ecole_id] = ecole.id if ecole?
      params[:caisse][:annee_id] = annee_active.id if annee_active?
      params.require(:caisse).permit(:montant, :libelle, :operation, :user_id, :admin_id, :ecole_id, :annee_id)
    end

    def depense_params
      params[:caisse][:operation] = "sortie"
      params[:caisse][:ecole_id] = ecole.id if ecole?
      params[:caisse][:annee_id] = annee_active.id if annee_active?
      params.require(:caisse).permit(:montant, :libelle, :operation, :user_id, :admin_id, :ecole_id, :annee_id)
    end
end
