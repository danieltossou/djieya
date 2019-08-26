class EtudiantsController < ApplicationController
  before_action :set_etudiant, only: [:show, :edit, :update, :destroy]

  # GET /etudiants
  # GET /etudiants.json
  def index
    @etudiants = Etudiant.all
  end

  # GET /etudiants/1
  # GET /etudiants/1.json
  def show
  end

  # GET /etudiants/new
  def new
    @etudiant = Etudiant.new
  end

  # GET /etudiants/1/edit
  def edit
  end

  # POST /etudiants
  # POST /etudiants.json
  def create
    @etudiant = current_user.etudiants.new(etudiant_params)
    @montant = @etudiant.classe_room.montant
    @annee = 1
    respond_to do |format|
      if @etudiant.save
        
        format.html { redirect_to @etudiant, notice: 'Etudiant was successfully created.' }
        format.json { render :show, status: :created, location: @etudiant }
      else
        format.html { render :new }
        format.json { render json: @etudiant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /etudiants/1
  # PATCH/PUT /etudiants/1.json
  def update
    respond_to do |format|
      if @etudiant.update(etudiant_params)
        format.html { redirect_to @etudiant, notice: 'Etudiant was successfully updated.' }
        format.json { render :show, status: :ok, location: @etudiant }
      else
        format.html { render :edit }
        format.json { render json: @etudiant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /etudiants/1
  # DELETE /etudiants/1.json
  def destroy
    @etudiant.destroy
    respond_to do |format|
      format.html { redirect_to etudiants_url, notice: 'Etudiant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_etudiant
      @etudiant = Etudiant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def etudiant_params
    # Generation d'un numero d'inscription automatique
      @last_etudiant = Etudiant.last.id
      @id = @last_etudiant + 1
      @date = Time.now.strftime("%Y").to_s
      @nom = params[:etudiant][:nom][0].to_s
      @prenom = params[:etudiant][:prenom][0].to_s
      @num_inscr = @date+'-'+@id.to_s+'-'+@nom+''+@prenom
      params[:etudiant][:num_inscription] = @num_inscr

      params.require(:etudiant).permit(:nom, :prenom, :sexe, :date_naissance, :montant, :matricule, :num_inscription, :classe_room_id, :oriente, :nationnalite, :email, :adresse, :contact, :maladie, :nom_parent, :contact_parent, :lien_parente, :email_parent, :photo, :autre, :ecole_id, :user_id, dossier_ids: [])
    end


end
