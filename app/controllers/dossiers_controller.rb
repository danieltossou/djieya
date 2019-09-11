class DossiersController < ApplicationController
  before_action :set_dossier, only: [:show, :edit, :update, :destroy]
  #load_and_authorize_resource
  skip_before_action :est_connecte?, only: :new
  
  # GET /dossiers
  # GET /dossiers.json
  def index
    @ecole = ecole.id if ecole?
    @dossiers = Dossier.ecole(@ecole).all.page(params[:page])
    @dossier = Dossier.new
  end

  # GET /dossiers/1
  # GET /dossiers/1.json
  def show
  end

  # GET /dossiers/new
  def new
    @dossier = Dossier.new
  end

  # GET /dossiers/1/edit
  def edit
  end

  # POST /dossiers
  # POST /dossiers.json
  def create
    @dossier = current_user.dossiers.new(dossier_params)

    respond_to do |format|
      if @dossier.save
        format.html { redirect_to dossiers_url, notice: 'Dossier was successfully created.' }
        format.json { render :show, status: :created, location: @dossier }
      else
        format.html { render :new }
        format.json { render json: @dossier.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dossiers/1
  # PATCH/PUT /dossiers/1.json
  def update
    respond_to do |format|
      if @dossier.update(dossier_params)
        format.html { redirect_to dossiers_url, notice: 'Dossier was successfully updated.' }
        format.json { render :show, status: :ok, location: @dossier }
      else
        format.html { render :edit }
        format.json { render json: @dossier.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dossiers/1
  # DELETE /dossiers/1.json
  def destroy
    @dossier.destroy
    respond_to do |format|
      format.html { redirect_to dossiers_url, notice: 'Dossier was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
    @ecole = ecole.id if ecole?
    @search = params[:id_search]
    @dossiers = Dossier.where('libelle LIKE ?', "%#{@search}%").ecole(@ecole).all

    if request.xhr?
      render :partial => 'dossiers', locals: {:dossiers => @dossiers}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dossier
      @dossier = Dossier.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dossier_params
      params[:dossier][:ecole_id] = ecole.id if ecole?
      params.require(:dossier).permit(:libelle, :ecole_id, :user_id)
    end
end
