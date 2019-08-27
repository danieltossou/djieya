class CreateInscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :inscriptions do |t|
      t.references :etudiant, null: false, foreign_key: true
      t.references :user, null: true, foreign_key: true
      t.references :admin, null: true, foreign_key: true
      t.references :annee, null: false, foreign_key: true
      t.references :classe_room, null: false, foreign_key: true
      t.references :ecole, null: false, foreign_key: true
      t.integer :montant, limit: 8

      t.timestamps
    end
  end
end
