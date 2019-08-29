class CreateDisponibilites < ActiveRecord::Migration[6.0]
  def change
    create_table :disponibilites do |t|
      t.references :creneau, null: false, foreign_key: true
      t.references :enseignant, null: false, foreign_key: true
      t.references :jour, null: false, foreign_key: true
      t.references :admin, null: true, foreign_key: true
      t.references :user, null: true, foreign_key: true
      t.references :ecole, null: false, foreign_key: true

      t.timestamps
    end
  end
end
