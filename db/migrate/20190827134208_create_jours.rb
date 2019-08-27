class CreateJours < ActiveRecord::Migration[6.0]
  def change
    create_table :jours do |t|
      t.string :libelle
      t.references :ecole, null: true, foreign_key: true
      t.references :user, null: true, foreign_key: true
      t.references :admin, null: true, foreign_key: true

      t.timestamps
    end
  end
end
