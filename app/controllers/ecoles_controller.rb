class EcolesController < ApplicationController
  before_action :set_ecole, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  
  # GET /ecoles
  # GET /ecoles.json
  def index
    @ecoles = Ecole.all.page(params[:page])
    @ecole = Ecole.new
  end

  # GET /ecoles/1
  # GET /ecoles/1.json
  def show
  end

  # GET /ecoles/new
  def new
    @ecole = Ecole.new
  end

  # GET /ecoles/1/edit
  def edit
  end

  # POST /ecoles
  # POST /ecoles.json
  def create
    if current_admin
      @ecole = current_admin.ecoles.new(ecole_params)
      respond_to do |format|
        if @ecole.save
          format.html { redirect_to @ecole, notice: 'Ecole was successfully created.' }
          format.json { render :show, status: :created, location: @ecole }
        else
          format.html { render :new }
          format.json { render json: @ecole.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to ecoles_path, notice: 'Vous devez etre connecté pour effectuer cette operation.' 
    end
  end

  # PATCH/PUT /ecoles/1
  # PATCH/PUT /ecoles/1.json
  def update
    respond_to do |format|
      if @ecole.update(ecole_params)
        format.html { redirect_to @ecole, notice: 'Ecole was successfully updated.' }
        format.json { render :show, status: :ok, location: @ecole }
      else
        format.html { render :edit }
        format.json { render json: @ecole.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ecoles/1
  # DELETE /ecoles/1.json
  def destroy
    @ecole.destroy
    respond_to do |format|
      format.html { redirect_to ecoles_url, notice: 'Ecole was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ecole
      @ecole = Ecole.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ecole_params
      params.require(:ecole).permit(:libelle, :etat, :admin_id)
    end
end
