class CreateDossiersEtudiants < ActiveRecord::Migration[6.0]
  def change
    create_table :dossiers_etudiants, id: false do |t|
      t.belongs_to :dossier
      t.belongs_to :etudiant
    end
  end
end
