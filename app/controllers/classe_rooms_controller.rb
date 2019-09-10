class ClasseRoomsController < ApplicationController
  before_action :set_classe_room, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  
  # GET /classe_rooms
  # GET /classe_rooms.json
  def index
    @ecole = ecole.id if ecole?
    @classe_rooms = ClasseRoom.ecole(@ecole).all.page(params[:page])
    @classe_room = ClasseRoom.new
  end

  # GET /classe_rooms/1
  # GET /classe_rooms/1.json
  def show
  end

  # GET /classe_rooms/new
  def new
    @classe_room = ClasseRoom.new
  end

  # GET /classe_rooms/1/edit
  def edit
  end

  # POST /classe_rooms
  # POST /classe_rooms.json
  def create
    if current_admin       
      @classe_room = current_admin.classeRooms.new(classe_room_params)
    elsif current_user                                          
      @classe_room = current_user.classeRooms.new(classe_room_params)
    else
      redirect_to new_classe_room_path, notice: 'Vous devez etre connecté pour effectuer cette operation.' 
    end

    respond_to do |format|
      if @classe_room.save
        format.html { redirect_to classe_rooms_url, notice: 'Classe room was successfully created.' }
        format.json { render :show, status: :created, location: @classe_room }
      else
        format.html { render :new }
        format.json { render json: @classe_room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /classe_rooms/1
  # PATCH/PUT /classe_rooms/1.json
  def update
    respond_to do |format|
      if @classe_room.update(classe_room_params)
        format.html { redirect_to classe_rooms_url, notice: 'Classe room was successfully updated.' }
        format.json { render :show, status: :ok, location: @classe_room }
      else
        format.html { render :edit }
        format.json { render json: @classe_room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /classe_rooms/1
  # DELETE /classe_rooms/1.json
  def destroy
    @classe_room.destroy
    respond_to do |format|
      format.html { redirect_to classe_rooms_url, notice: 'Classe room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
    @ecole = ecole.id if ecole?
    @search = params[:id_search]
    @classe_rooms = Classe_room.where('libelle LIKE ?', "%#{@search}%").ecole(@ecole).all

    if request.xhr?
      render :partial => 'classe_rooms', locals: {:classe_rooms => @classe_rooms}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_classe_room
      @classe_room = ClasseRoom.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def classe_room_params
      params[:classe_room][:ecole_id] = ecole.id if ecole?
      params.require(:classe_room).permit(:libelle, :etat, :user_id, :admin_id, :montant, :ecole_id, matiere_ids: [])
    end
end
