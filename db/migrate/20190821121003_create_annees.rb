class CreateAnnees < ActiveRecord::Migration[6.0]
  def change
    create_table :annees do |t|
      t.string :libelle
      t.boolean :etat
      t.references :admin, null: true, foreign_key: true
      t.references :user, null: true, foreign_key: true

      t.timestamps
    end
  end
end
