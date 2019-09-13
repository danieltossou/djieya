class CreateDroits < ActiveRecord::Migration[6.0]
  def change
    create_table :droits do |t|
      t.boolean :tableau_board, default: false
      t.boolean :annee, default: false
      t.boolean :utilisateur
      t.boolean :etudiant, default: false
      t.boolean :emploi_du_temps, default: false
      t.boolean :versement, default: false
      t.boolean :caisse, default: false
      t.boolean :classe_room, default: false
      t.boolean :matiere, default: false
      t.boolean :salle, default: false
      t.boolean :semestre, default: false
      t.boolean :dossier, default: false
      t.boolean :enseignant, default: false
      t.integer :admin, null: false, limit: 8
      t.references :user, null: false, foreign_key: true, unique: true

      t.timestamps
    end
  end
end
