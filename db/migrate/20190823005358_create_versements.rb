class CreateVersements < ActiveRecord::Migration[6.0]
  def change
    create_table :versements do |t|
      t.integer :montant, limit: 8
      t.references :user, null: true, foreign_key: true
      t.references :admin, null: true, foreign_key: true
      t.references :ecole, null: false, foreign_key: true
      t.references :annee, null: false, foreign_key: true
      t.references :etudiant, null: true, foreign_key: true

      t.timestamps
    end
  end
end
