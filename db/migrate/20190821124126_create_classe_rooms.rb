class CreateClasseRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :classe_rooms do |t|
      t.string :libelle
      t.boolean :etat
      t.references :user, null: true, foreign_key: true
      t.references :user, null: true, foreign_key: true
      t.integer :montant, limit: 8
      t.references :ecole, null: false, foreign_key: true

      t.timestamps
    end
  end
end
