class CreateHeures < ActiveRecord::Migration[6.0]
  def change
    create_table :heures do |t|
      t.string :libelle
      t.references :ecole, null: true, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
