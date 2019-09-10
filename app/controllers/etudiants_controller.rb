class EtudiantsController < ApplicationController
  before_action :set_etudiant, only: [:show, :edit, :update, :destroy]
  #load_and_authorize_resource
  
  # GET /etudiants
  # GET /etudiants.json
  def index
    @ecole = ecole.id if ecole?
    @etudiants = Etudiant.ecole(@ecole).all.page(params[:page])
    @etudiant = Etudiant.new
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
    if current_admin
      @etudiant = current_admin.etudiants.new(etudiant_params)
    elsif current_user
      @etudiant = current_user.etudiants.new(etudiant_params)
    else
      redirect_to new_etudiant_path, notice: 'Vous devez etre connecté pour effectuer cette operation.' 
    end
    @montant = @etudiant.classe_room.montant
    respond_to do |format|
      if @etudiant.save
        
        format.html { redirect_to etudiants_url, notice: 'Etudiant was successfully created.' }
        format.json { render :show, status: :created, location: @etudiant }
      else
        format.html { render :new }
        format.json { render json: @etudiant.errors, status: :unprocessable_entity }
      end
    end
  end

  def search
    @ecole = ecole.id if ecole?
    @search = params[:id_search]
    @etudiants = Etudiant.where('nom LIKE ?', "%#{@search}%").or(Etudiant.where('prenom LIKE ?', "%#{@search}%")).or(Etudiant.where('num_inscription LIKE ?', "%#{@search}%")).or(Etudiant.where('matricule LIKE ?', "%#{@search}%")).ecole(@ecole).all

    if request.xhr?
      render :partial => 'etudiants', locals: {:etudiants => @etudiants}
    end
  end

  # PATCH/PUT /etudiants/1
  # PATCH/PUT /etudiants/1.json
  def update
    respond_to do |format|
      if @etudiant.update(etudiant_params)
        format.html { redirect_to etudiants_url, notice: 'Etudiant was successfully updated.' }
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
    if Etudiant.last == nil
      @last_etudiant = 0
    else
      @last_etudiant = Etudiant.last.id
    end
      @id = @last_etudiant + 1
      @date = Time.now.strftime("%Y").to_s
      @nom = params[:etudiant][:nom][0].to_s
      @prenom = params[:etudiant][:prenom][0].to_s
      @num_inscr = @date+'-'+@id.to_s+'-'+@nom+''+@prenom
      params[:etudiant][:num_inscription] = @num_inscr

      params[:etudiant][:ecole_id] = ecole.id if ecole?

      params.require(:etudiant).permit(:nom, :prenom, :sexe, :date_naissance, :montant, :matricule, :num_inscription, :classe_room_id, :oriente, :nationnalite, :email, :adresse, :contact, :maladie, :nom_parent, :contact_parent, :lien_parente, :email_parent, :photo, :autre, :ecole_id, :user_id, dossier_ids: [])
    end


end
