class DroitsController < ApplicationController
  before_action :set_droit, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :autorisation

  # GET /droits
  # GET /droits.json
  def index
    @droits = Droit.all
  end

  # GET /droits/1
  # GET /droits/1.json
  def show
  end

  # GET /droits/new
  def new
    @droit = Droit.new
    @user_droit = Droit.select(:user_id).all
  end

  # GET /droits/1/edit
  def edit
  end

  # POST /droits
  # POST /droits.json
  def create
    @droit = Droit.new(droit_params)

    respond_to do |format|
      if @droit.save
        format.html { redirect_to @droit, notice: 'Droit was successfully created.' }
        format.json { render :show, status: :created, location: @droit }
      else
        format.html { render :new }
        format.json { render json: @droit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /droits/1
  # PATCH/PUT /droits/1.json
  def update
    respond_to do |format|
      if @droit.update(droit_params)
        format.html { redirect_to @droit, notice: 'Droit was successfully updated.' }
        format.json { render :show, status: :ok, location: @droit }
      else
        format.html { render :edit }
        format.json { render json: @droit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /droits/1
  # DELETE /droits/1.json
  def destroy
    @droit.destroy
    respond_to do |format|
      format.html { redirect_to droits_url, notice: 'Droit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_droit
      @droit = Droit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def droit_params
      params[:droit][:admin] = current_user.id
      params.require(:droit).permit(:tableau_board, :annee, :utilisateur, :etudiant, :emploi_du_temps, :versement, :caisse, :classe_room, :matiere, :salle, :semestre, :dossier, :enseignant, :admin, :user_id)
    end

    # Redirection à la page d'acceuil si il n'a pas le droit
    def autorisation
      redirect_to root_path, alert: "Vous n'avez pas le droit d'effectué cette action" if !can_droit?
    end
end
