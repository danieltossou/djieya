class CreateEnseignantsMatieres < ActiveRecord::Migration[6.0]
  def change
    create_table :enseignants_matieres, id: false do |t|
      t.belongs_to :enseignant, null: false, foreign_key: true
      t.belongs_to :matiere, null: false, foreign_key: true
    end
  end
end
