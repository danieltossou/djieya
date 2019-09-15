class JoursController < ApplicationController
  before_action :set_jour, only: [:show, :edit, :update, :destroy]
  # load_and_authorize_resource
  before_action :autorisation
  
  # GET /jours
  # GET /jours.json
  def index
    @ecole = ecole.id if ecole?
    @jours = Jour.ecole(@ecole).all.page(params[:page])
    @jour = Jour.new
  end

  # GET /jours/1
  # GET /jours/1.json
  def show
  end

  # GET /jours/new
  def new
    @jour = Jour.new
  end

  # GET /jours/1/edit
  def edit
  end

  # POST /jours
  # POST /jours.json
  def create

    @jour = current_user.jours.new(jour_params)

    respond_to do |format|
      if @jour.save
        format.html { redirect_to jours_url, notice: 'Jour was successfully created.' }
        format.json { render :show, status: :created, location: @jour }
      else
        format.html { render :new }
        format.json { render json: @jour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jours/1
  # PATCH/PUT /jours/1.json
  def update
    respond_to do |format|
      if @jour.update(jour_params)
        format.html { redirect_to jours_url, notice: 'Jour was successfully updated.' }
        format.json { render :show, status: :ok, location: @jour }
      else
        format.html { render :edit }
        format.json { render json: @jour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jours/1
  # DELETE /jours/1.json
  def destroy
    @jour.destroy
    respond_to do |format|
      format.html { redirect_to jours_url, notice: 'Jour was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
    @ecole = ecole.id if ecole?
    @search = params[:id_search]
    @jours = Jour.where('libelle LIKE ?', "%#{@search}%").ecole(@ecole).all

    if request.xhr?
      render :partial => 'jours', locals: {:jours => @jours}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jour
      @jour = Jour.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def jour_params
      params[:jour][:ecole_id] = ecole.id if ecole?
      params.require(:jour).permit(:libelle, :ecole_id, :user_id)
    end

    # Redirection à la page d'acceuil si il n'a pas le droit
    def autorisation
      redirect_to root_path, alert: "Vous n'avez pas le droit d'effectué cette action" if !can_jour?
    end
end
