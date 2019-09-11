class CreateCours < ActiveRecord::Migration[6.0]
  def change
    create_table :cours do |t|
      t.references :enseignant, null: false, foreign_key: true
      t.references :matiere, null: false, foreign_key: true
      t.references :classe_room, null: false, foreign_key: true
      t.references :salle, null: false, foreign_key: true
      t.references :creneau, null: false, foreign_key: true
      t.references :jour, null: false, foreign_key: true
      t.integer :nombre_heure
      t.string :numero_cours
      t.string :numero_cours_g
      t.references :annee, null: false, foreign_key: true
      t.references :ecole, null: false, foreign_key: true
      t.references :semestre, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
