class CreateEnseignants < ActiveRecord::Migration[6.0]
  def change
    create_table :enseignants do |t|
      t.string :nom
      t.string :prenom
      t.integer :contact, limit: 8
      t.string :email
      t.string :adresse
      t.string :sexe
      t.references :ecole, null: false, foreign_key: true
      t.references :user, null: true, foreign_key: true
      t.references :admin, null: true, foreign_key: true

      t.timestamps
    end
  end
end
