class AnneesController < ApplicationController
  before_action :set_annee, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  
  # GET /annees
  # GET /annees.json
  def index
    @annees = Annee.all.page(params[:page])
    @annee = Annee.new
  end

  # GET /annees/1
  # GET /annees/1.json
  def show
  end

  # GET /annees/new
  def new
    @annee = Annee.new
  end

  # GET /annees/1/edit
  def edit
  end

  # POST /annees
  # POST /annees.json
  def create
    if current_admin
      @annee = current_admin.annees.new(annee_params)
    elsif current_user
      @annee = current_user.annees.new(annee_params)
    else
      redirect_to new_annee_path, notice: 'Vous devez etre connecté pour effectuer cette operation.' 
    end

    respond_to do |format|
      if @annee.save
        format.html { redirect_to @annees, notice: 'Annee was successfully created.' }
        format.json { render :show, status: :created, location: @annee }
      else
        format.html { render :new }
        format.json { render json: @annee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /annees/1
  # PATCH/PUT /annees/1.json
  def update
    respond_to do |format|
      if @annee.update(annee_params)
        format.html { redirect_to @annees, notice: 'Annee was successfully updated.' }
        format.json { render :show, status: :ok, location: @annee }
      else
        format.html { render :edit }
        format.json { render json: @annee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /annees/1
  # DELETE /annees/1.json
  def destroy
    @annee.destroy
    respond_to do |format|
      format.html { redirect_to annees_url, notice: 'Annee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
    @ecole = ecole.id if ecole?
    @search = params[:id_search]
    @annees = Annee.where('libelle LIKE ?', "%#{@search}%").ecole(@ecole).all

    if request.xhr?
      render :partial => 'annees', locals: {:annees => @annees}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_annee
      @annee = Annee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def annee_params
      params.require(:annee).permit(:libelle, :etat, :admin_id)
    end
end
