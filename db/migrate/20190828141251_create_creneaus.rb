class CreateCreneaus < ActiveRecord::Migration[6.0]
  def change
    create_table :creneaus do |t|
      t.string :debut
      t.string :fin
      t.references :admin, null: true, foreign_key: true
      t.references :user, null: true, foreign_key: true
      t.references :ecole, null: false, foreign_key: true

      t.timestamps
    end
  end
end
