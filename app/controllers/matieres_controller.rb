class MatieresController < ApplicationController
  before_action :set_matiere, only: [:show, :edit, :update, :destroy]
  #load_and_authorize_resource
  before_action :autorisation
  
  # GET /matieres
  # GET /matieres.json
  def index
    @ecole = ecole.id if ecole?
    @matieres = Matiere.ecole(@ecole).all.page(params[:page])
    @matiere = Matiere.new
  end

  # GET /matieres/1
  # GET /matieres/1.json
  def show
  end

  # GET /matieres/new
  def new
    @matiere = Matiere.new
  end

  # GET /matieres/1/edit
  def edit
  end

  # POST /matieres
  # POST /matieres.json
  def create
    @matiere = current_user.matieres.new(matiere_params)
    
    respond_to do |format|
      if @matiere.save
        format.html { redirect_to matieres_url, notice: 'Matiere was successfully created.' }
        format.json { render :show, status: :created, location: @matiere }
      else
        format.html { render :new }
        format.json { render json: @matiere.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /matieres/1
  # PATCH/PUT /matieres/1.json
  def update
    respond_to do |format|
      if @matiere.update(matiere_params)
        format.html { redirect_to matieres_url, notice: 'Matiere was successfully updated.' }
        format.json { render :show, status: :ok, location: @matiere }
      else
        format.html { render :edit }
        format.json { render json: @matiere.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matieres/1
  # DELETE /matieres/1.json
  def destroy
    @matiere.destroy
    respond_to do |format|
      format.html { redirect_to matieres_url, notice: 'Matiere was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
    @ecole = ecole.id if ecole?
    @search = params[:id_search]
    @matieres = Matiere.where('libelle LIKE ?', "%#{@search}%").ecole(@ecole).all

    if request.xhr?
      render :partial => 'matieres', locals: {:matieres => @matieres}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_matiere
      @matiere = Matiere.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def matiere_params
      params[:matiere][:ecole_id] = ecole.id if ecole?
      params.require(:matiere).permit(:libelle, :ecole_id, :user_id)
    end

    # Redirection à la page d'acceuil si il n'a pas le droit
    def autorisation
      redirect_to root_path, alert: "Vous n'avez pas le droit d'effectué cette action" if !can_matiere?
    end
end
