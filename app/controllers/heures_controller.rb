class HeuresController < ApplicationController
  before_action :set_heure, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  
  # GET /heures
  # GET /heures.json
  def index
    @heure = Heure.new
    @heures = Heure.all
  end

  # GET /heures/1
  # GET /heures/1.json
  def show
  end

  # GET /heures/new
  def new
    @heure = Heure.new
  end

  # GET /heures/1/edit
  def edit
  end

  # POST /heures
  # POST /heures.json
  def create

    if current_admin
      @heure = current_admin.heures.new(heure_params)
    elsif current_user
      @heure = current_user.heures.new(heure_params)
    else
      redirect_to new_heure_path, notice: 'Vous devez etre connecté pour effectuer cette operation.' 
    end

    respond_to do |format|
      if @heure.save
        format.html { redirect_to @heure, notice: 'Heure was successfully created.' }
        format.json { render :show, status: :created, location: @heure }
      else
        format.html { render :new }
        format.json { render json: @heure.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /heures/1
  # PATCH/PUT /heures/1.json
  def update
    respond_to do |format|
      if @heure.update(heure_params)
        format.html { redirect_to @heure, notice: 'Heure was successfully updated.' }
        format.json { render :show, status: :ok, location: @heure }
      else
        format.html { render :edit }
        format.json { render json: @heure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /heures/1
  # DELETE /heures/1.json
  def destroy
    @heure.destroy
    respond_to do |format|
      format.html { redirect_to heures_url, notice: 'Heure was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_heure
      @heure = Heure.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def heure_params
      params[:heure][:ecole_id] = ecole.id if ecole?
      params.require(:heure).permit(:libelle, :ecole_id, :user_id, :admin_id)
    end
end
