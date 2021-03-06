class CreateDossiers < ActiveRecord::Migration[6.0]
  def change
    create_table :dossiers do |t|
      t.string :libelle
      t.references :ecole, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :slug

      t.timestamps
    end
  end
end
