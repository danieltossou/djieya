class CoursController < ApplicationController
  before_action :set_cour, only: [:show, :edit, :update, :destroy]

  # GET /cours
  # GET /cours.json
  def index
    @cours = Cour.all
  end

  # GET /cours/1
  # GET /cours/1.json
  def show
  end

  # GET /cours/new
  def new
    @cour = Cour.new
  end

  # GET /cours/1/edit
  def edit
  end

  # POST /cours
  # POST /cours.json
  def create
    
    params[:cour][:ecole_id] = 1

      #Ajout de la classe en groupe
      params[:cour][:classe_room_id].unshift(params[:cour][:first_classe_room_id])

      @creneau = params[:cour][:creneau_debut].to_i 
      @nombre_heure = params[:cour][:creneau_fin].to_i - params[:cour][:creneau_debut].to_i + 1
      @classe_rooms = params[:cour][:classe_room_id]

    if current_admin
      
        # Enregistrement des cours pour chaque creneau
        @nombre_heure.times do 
          # Enregistrement pour chaque chaque par creneau
          @classe_rooms.size.times do |i|
            @cour = current_admin.cours.create(enseignant_id: params[:cour][:enseignant_id], matiere_id: params[:cour][:matiere_id], salle_id: params[:cour][:salle_id], creneau_id: @creneau, jour_id: params[:cour][:jour_id], nombre_heure: @nombre_heure, annee_id: params[:cour][:annee_id], ecole_id: params[:cour][:ecole_id], semestre_id: params[:cour][:annee_id], classe_room_id: @classe_rooms[i])
          end
          @creneau = @creneau + 1
        end

    elsif current_user

        # Enregistrement des cours pour chaque creneau
        @nombre_heure.times do 
          # Enregistrement pour chaque chaque par creneau
          @classe_rooms.size.times do |i|
            @cour = current_user.cours.create(enseignant_id: params[:cour][:enseignant_id], matiere_id: params[:cour][:matiere_id], salle_id: params[:cour][:salle_id], creneau_id: @creneau, jour_id: params[:cour][:jour_id], nombre_heure: @nombre_heure, annee_id: params[:cour][:annee_id], ecole_id: params[:cour][:ecole_id], semestre_id: params[:cour][:annee_id], classe_room_id: @classe_rooms[i])
          end
          @creneau = @creneau + 1
        end

     end

    respond_to do |format|
      if @cour
        format.html { redirect_to @cour, notice: 'Cours was successfully created.' }
        format.json { render :show, status: :created, location: @cour }
      else
        format.html { render :new }
        format.json { render json: @cour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cours/1
  # PATCH/PUT /cours/1.json
  def update
    respond_to do |format|
      if @cour.update(cour_params)
        format.html { redirect_to @cour, notice: 'Time table was successfully updated.' }
        format.json { render :show, status: :ok, location: @cour }
      else
        format.html { render :edit }
        format.json { render json: @cour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cours/1
  # DELETE /cours/1.json
  def destroy
    @cour.destroy
    respond_to do |format|
      format.html { redirect_to cours_url, notice: 'Time table was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # Request ajax pour les matieres par rapport a une classe
  def matieres()
    @matieres = Matiere.all;
    puts string = "Pisco Pa";
    # puts "++++++++++++++++++++#{id}"
    return string;
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cour
      @cour = Cour.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cour_params
      params.require(:cour).permit(:enseignant_id, :matiere_id, :salle_id, :creneau_debut, :creneau_fin, :jour_id, :nombre_heure, :numero_cours, :numero_cours_g, :annee_id, :ecole_id, :semestre_id, :user_id, :admin_id, :first_classe_room_id, :classe_room_id)
    end
end
