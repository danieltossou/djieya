class CreneausController < ApplicationController
  before_action :set_creneau, only: [:show, :edit, :update, :destroy]
  before_action :autorisation

  # GET /creneaus
  # GET /creneaus.json
  def index
    @creneaus = Creneau.all.page(params[:page])
    @creneau = Creneau.new
  end

  # GET /creneaus/1
  # GET /creneaus/1.json
  def show
  end

  # GET /creneaus/new
  def new
    @creneau = Creneau.new
  end

  # GET /creneaus/1/edit
  def edit
  end

  # POST /creneaus
  # POST /creneaus.json
  def create

    @creneau = current_user.creneaus.new(creneau_params)

    respond_to do |format|
      if @creneau.save
        format.html { redirect_to creneaus_url, notice: 'Creneau was successfully created.' }
        format.json { render :show, status: :created, location: @creneau }
      else
        format.html { render :new }
        format.json { render json: @creneau.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /creneaus/1
  # PATCH/PUT /creneaus/1.json
  def update
    respond_to do |format|
      if @creneau.update(creneau_params)
        format.html { redirect_to creneaus_url, notice: 'Creneau was successfully updated.' }
        format.json { render :show, status: :ok, location: @creneau }
      else
        format.html { render :edit }
        format.json { render json: @creneau.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /creneaus/1
  # DELETE /creneaus/1.json
  def destroy
    @creneau.destroy
    respond_to do |format|
      format.html { redirect_to creneaus_url, notice: 'Creneau was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
    @ecole = ecole.id if ecole?
    @search = params[:id_search]
    @creneaus = Creneau.where('debut LIKE ?', "%#{@search}%").or(Creneau.where('fin LIKE ?', "%#{@search}%")).ecole(@ecole).all

    if request.xhr?
      render :partial => 'creneaus', locals: {:creneaus => @creneaus}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_creneau
      @creneau = Creneau.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def creneau_params
      params[:creneau][:ecole_id] = ecole.id
      params.require(:creneau).permit(:debut, :fin, :user_id, :ecole_id)
    end

    # Redirection à la page d'acceuil si il n'a pas le droit
    def autorisation
      redirect_to root_path, alert: "Vous n'avez pas le droit d'effectué cette action" if !can_creneau?
    end
end
