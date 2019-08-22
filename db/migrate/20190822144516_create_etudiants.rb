class CreateEtudiants < ActiveRecord::Migration[6.0]
  def change
    create_table :etudiants do |t|
      t.string :nom
      t.string :prenom
      t.string :sexe
      t.datetime :date_naissance
      t.string :matricule
      t.string :num_inscription
      t.references :classe_room, null: false, foreign_key: true
      t.boolean :oriente
      t.string :nationnalite
      t.string :email
      t.text :adresse
      t.integer :contact, limit: 8
      t.string :maladie
      t.string :nom_parent
      t.integer :contact_parent, limit: 8
      t.string :lien_parente
      t.string :email_parent
      t.string :photo
      t.string :autre
      t.references :ecole, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
