class SemestresController < ApplicationController
  before_action :set_semestre, only: [:show, :edit, :update, :destroy]
  before_action :autorisation

  # GET /semestres
  # GET /semestres.json
  def index
    @ecole = ecole.id if ecole?
    @semestres = Semestre.ecole(@ecole).all.page(params[:page])
    @semestre = Semestre.new
  end

  # GET /semestres/1
  # GET /semestres/1.json
  def show
  end

  # GET /semestres/new
  def new
    @semestre = Semestre.new
  end

  # GET /semestres/1/edit
  def edit
  end

  # POST /semestres
  # POST /semestres.json
  def create

    @semestre = current_user.semestres.new(semestre_params)

    respond_to do |format|
      if @semestre.save
        format.html { redirect_to semestres_url, notice: 'Semestre was successfully created.' }
        format.json { render :show, status: :created, location: @semestre }
      else
        format.html { render :new }
        format.json { render json: @semestre.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /semestres/1
  # PATCH/PUT /semestres/1.json
  def update
    respond_to do |format|
      if @semestre.update(semestre_params)
        format.html { redirect_to semestres_url, notice: 'Semestre was successfully updated.' }
        format.json { render :show, status: :ok, location: @semestre }
      else
        format.html { render :edit }
        format.json { render json: @semestre.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /semestres/1
  # DELETE /semestres/1.json
  def destroy
    @semestre.destroy
    respond_to do |format|
      format.html { redirect_to semestres_url, notice: 'Semestre was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
    @ecole = ecole.id if ecole?
    @search = params[:id_search]
    @semestres = Semestre.where('libelle LIKE ?', "%#{@search}%").ecole(@ecole).all

    if request.xhr?
      render :partial => 'semestres', locals: {:semestres => @semestres}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_semestre
      @semestre = Semestre.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def semestre_params
      params[:semestre][:ecole_id] = ecole.id if ecole?
      params.require(:semestre).permit(:libelle, :admin_id, :user_id, :ecole_id)
    end

    # Redirection à la page d'acceuil si il n'a pas le droit
    def autorisation
      redirect_to root_path, alert: "Vous n'avez pas le droit d'effectué cette action" if !can_semestre?
    end
end
